import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

/// Connectivity Service - Monitors internet connection status
///
/// Features:
/// - Real-time connectivity monitoring
/// - Internet reachability check (not just WiFi/Mobile connection)
/// - Auto-retry on connection restoration
/// - Stream-based architecture for reactive UI
class ConnectivityService {
  static final ConnectivityService _instance = ConnectivityService._internal();
  factory ConnectivityService() => _instance;
  ConnectivityService._internal();

  final Connectivity _connectivity = Connectivity();

  // Stream controllers
  final _connectionStatusController = StreamController<bool>.broadcast();
  final _connectionTypeController = StreamController<ConnectivityResult>.broadcast();

  // Current state
  bool _isConnected = true;
  bool _isCheckingConnection = false;
  ConnectivityResult _currentConnectionType = ConnectivityResult.none;

  // Subscription
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;
  Timer? _periodicCheckTimer;

  // Public streams
  Stream<bool> get connectionStatus => _connectionStatusController.stream;
  Stream<ConnectivityResult> get connectionType => _connectionTypeController.stream;

  // Public getters
  bool get isConnected => _isConnected;
  ConnectivityResult get currentConnectionType => _currentConnectionType;

  /// Initialize connectivity monitoring
  Future<void> initialize() async {
    debugPrint('[Connectivity] 🌐 Initializing connectivity service...');

    try {
      // Check initial connectivity
      await checkConnectivity();

      // Listen to connectivity changes
      _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
        _handleConnectivityChange,
        onError: (error) {
          debugPrint('[Connectivity] ❌ Error in connectivity stream: $error');
        },
      );

      // Periodic internet reachability check (every 30 seconds)
      _periodicCheckTimer = Timer.periodic(
        const Duration(seconds: 30),
        (_) => _performInternetCheck(),
      );

      debugPrint('[Connectivity] ✅ Connectivity service initialized');
    } catch (e) {
      debugPrint('[Connectivity] ❌ Initialization error: $e');
    }
  }

  /// Handle connectivity changes from connectivity_plus
  void _handleConnectivityChange(List<ConnectivityResult> results) {
    if (results.isEmpty) {
      _updateConnectionStatus(ConnectivityResult.none, false);
      return;
    }

    final result = results.first;
    debugPrint('[Connectivity] 📡 Connection type changed: $result');

    // Update connection type immediately
    _currentConnectionType = result;
    _connectionTypeController.add(result);

    // Check actual internet reachability
    if (result != ConnectivityResult.none) {
      _performInternetCheck();
    } else {
      _updateConnectionStatus(result, false);
    }
  }

  /// Check current connectivity status
  Future<bool> checkConnectivity() async {
    try {
      final results = await _connectivity.checkConnectivity();
      if (results.isEmpty) {
        _updateConnectionStatus(ConnectivityResult.none, false);
        return false;
      }

      final result = results.first;
      _currentConnectionType = result;
      _connectionTypeController.add(result);

      if (result == ConnectivityResult.none) {
        _updateConnectionStatus(result, false);
        return false;
      }

      // Check actual internet reachability
      return await _performInternetCheck();
    } catch (e) {
      debugPrint('[Connectivity] ❌ Error checking connectivity: $e');
      _updateConnectionStatus(ConnectivityResult.none, false);
      return false;
    }
  }

  /// Perform actual internet reachability check
  /// (connectivity_plus only checks device connection, not internet access)
  Future<bool> _performInternetCheck() async {
    if (_isCheckingConnection) {
      return _isConnected;
    }

    _isCheckingConnection = true;

    try {
      // Try to reach Google DNS (reliable endpoint)
      final result = await InternetAddress.lookup('google.com').timeout(const Duration(seconds: 5));

      final hasInternet = result.isNotEmpty && result[0].rawAddress.isNotEmpty;

      _updateConnectionStatus(_currentConnectionType, hasInternet);

      if (hasInternet) {
        debugPrint('[Connectivity] ✅ Internet reachable');
      } else {
        debugPrint('[Connectivity] ⚠️ No internet access');
      }

      _isCheckingConnection = false;
      return hasInternet;
    } on SocketException catch (_) {
      debugPrint('[Connectivity] ❌ No internet connection (SocketException)');
      _updateConnectionStatus(_currentConnectionType, false);
      _isCheckingConnection = false;
      return false;
    } on TimeoutException catch (_) {
      debugPrint('[Connectivity] ❌ Internet check timeout');
      _updateConnectionStatus(_currentConnectionType, false);
      _isCheckingConnection = false;
      return false;
    } catch (e) {
      debugPrint('[Connectivity] ❌ Internet check error: $e');
      _updateConnectionStatus(_currentConnectionType, false);
      _isCheckingConnection = false;
      return false;
    }
  }

  /// Update connection status and notify listeners
  void _updateConnectionStatus(ConnectivityResult type, bool connected) {
    final statusChanged = _isConnected != connected;

    _isConnected = connected;
    _currentConnectionType = type;

    if (statusChanged) {
      _connectionStatusController.add(connected);

      if (connected) {
        debugPrint('[Connectivity] 🟢 Connected to internet via $type');
      } else {
        debugPrint('[Connectivity] 🔴 Disconnected from internet');
      }
    }
  }

  /// Get connection type as human-readable string
  String getConnectionTypeString() {
    switch (_currentConnectionType) {
      case ConnectivityResult.wifi:
        return 'WiFi';
      case ConnectivityResult.mobile:
        return 'Mobile Data';
      case ConnectivityResult.ethernet:
        return 'Ethernet';
      case ConnectivityResult.vpn:
        return 'VPN';
      case ConnectivityResult.bluetooth:
        return 'Bluetooth';
      case ConnectivityResult.other:
        return 'Other';
      case ConnectivityResult.none:
        return 'No Connection';
      }
  }

  /// Wait for internet connection (useful for retry logic)
  Future<void> waitForConnection({Duration timeout = const Duration(seconds: 30)}) async {
    if (_isConnected) return;

    debugPrint('[Connectivity] ⏳ Waiting for internet connection...');

    final completer = Completer<void>();
    late StreamSubscription<bool> subscription;

    subscription = connectionStatus.listen((connected) {
      if (connected) {
        debugPrint('[Connectivity] ✅ Connection restored');
        subscription.cancel();
        if (!completer.isCompleted) {
          completer.complete();
        }
      }
    });

    // Add timeout
    Future.delayed(timeout, () {
      if (!completer.isCompleted) {
        subscription.cancel();
        completer.completeError(TimeoutException('Connection timeout'));
      }
    });

    return completer.future;
  }

  /// Execute an operation with connectivity check and retry
  Future<T> executeWithConnectivity<T>({
    required Future<T> Function() operation,
    required String operationName,
    int maxRetries = 3,
    Duration retryDelay = const Duration(seconds: 2),
  }) async {
    int attempts = 0;

    while (attempts < maxRetries) {
      attempts++;

      // Check connectivity before operation
      final hasConnection = await checkConnectivity();

      if (!hasConnection) {
        debugPrint(
          '[Connectivity] ⚠️ No connection for $operationName (attempt $attempts/$maxRetries)',
        );

        if (attempts >= maxRetries) {
          throw Exception('No internet connection. Please check your network and try again.');
        }

        // Wait for connection or retry delay
        try {
          await waitForConnection(timeout: retryDelay);
        } catch (_) {
          // Timeout waiting for connection, continue to retry
          await Future.delayed(retryDelay);
        }
        continue;
      }

      // Execute operation
      try {
        debugPrint('[Connectivity] ▶️ Executing $operationName (attempt $attempts)');
        final result = await operation();
        debugPrint('[Connectivity] ✅ $operationName completed successfully');
        return result;
      } catch (e) {
        debugPrint('[Connectivity] ❌ $operationName failed: $e');

        if (attempts >= maxRetries) {
          rethrow;
        }

        // Check if error is network-related
        if (e is SocketException || e is TimeoutException || e.toString().contains('network')) {
          debugPrint('[Connectivity] 🔄 Network error, retrying...');
          await Future.delayed(retryDelay);
        } else {
          // Non-network error, don't retry
          rethrow;
        }
      }
    }

    throw Exception('Operation failed after $maxRetries attempts');
  }

  /// Dispose resources
  void dispose() {
    debugPrint('[Connectivity] 🧹 Disposing connectivity service');
    _connectivitySubscription?.cancel();
    _periodicCheckTimer?.cancel();
    _connectionStatusController.close();
    _connectionTypeController.close();
  }
}
