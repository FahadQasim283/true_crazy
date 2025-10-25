enum ConnectionStatus { CONNECTED, DISCONNECTED, CONNECTING }

extension ConnectionStatusExtension on ConnectionStatus {
  String get displayName {
    switch (this) {
      case ConnectionStatus.CONNECTED:
        return 'Connected';
      case ConnectionStatus.DISCONNECTED:
        return 'Disconnected';
      case ConnectionStatus.CONNECTING:
        return 'Connecting';
    }
  }
}
