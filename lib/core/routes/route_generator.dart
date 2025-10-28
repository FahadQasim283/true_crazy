import 'dart:convert';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/core/services/deep_link_service.dart';
import '/core/services/local_storage/token_storage.dart';
import 'route_config.dart';
import 'route_names.dart';
import '/presentation/splash_screen.dart';
import '/core/shared/widgets/page_transition_widget.dart';
import '/presentation/login_screen.dart';

// Use the DeepLinkService navigatorKey for navigation and deep linking
final GlobalKey<NavigatorState> rootNavigatorKey = DeepLinkService.navigatorKey;

class RouteGenerator {
  static Future<bool> _isAuthenticated() async {
    final userData = await TokenStorage.getUserData();
    if (userData == null || userData.isEmpty) {
      debugPrint('User is not authenticated');
      return false;
    } else {
      if (jsonDecode(userData)['isVerified'] == false) {
        debugPrint('User is not verified');
        return false;
      }

      ///print
      debugPrint("User data found: $userData");
      final String? userToken = await TokenStorage.getRefreshToken();
      if (userToken != null) {
        debugPrint("User data found: $userToken");
        return true;
      }
      // No refresh token found. Treat as not authenticated.
      debugPrint('No refresh token present. User is not authenticated');
      await TokenStorage.clearAll();
      return false;
    }
  }

  static final GoRouter router = GoRouter(
    initialLocation: RouteNames.splash,
    debugLogDiagnostics: kDebugMode,

    redirect: (BuildContext context, GoRouterState state) async {
      final String location = state.matchedLocation;
      final bool isAuthenticated = await _isAuthenticated();
      if (isAuthenticated && (location == RouteNames.splash || location == RouteNames.onboarding)) {
        debugPrint('Redirecting from splash/onboarding to home');
        return '${RouteNames.mainTab}/${RouteNames.home}';
      }
      if (location == RouteNames.splash) {
        debugPrint('Redirecting from splash to onboarding');
        return null;
      }

      if (!isAuthenticated && RouteConfig.requiresAuth(location)) {
        debugPrint('Redirecting to login from unauthenticated route: $location cation');
        return RouteNames.login;
      }

      return null;
    },
    navigatorKey: rootNavigatorKey,
    routes: [
      GoRoute(
        path: RouteNames.splash,
        name: RouteNames.splash.name,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return buildPageWithTransition(key: state.pageKey, child: const SplashScreen());
        },
      ),
      GoRoute(
        path: RouteNames.login,
        name: RouteNames.login.name,
        pageBuilder: (context, state) => buildPageWithTransition(
          key: state.pageKey,
          child: const LoginScreen(),
          type: PageTransitionType.slideFromRight,
        ),
      ),
    ],

    errorBuilder: (context, state) =>
        ErrorScreen(errorMessage: state.error?.toString(), currentLocation: state.matchedLocation),
  );
}

class ErrorScreen extends StatelessWidget {
  final String? errorMessage;
  final String? currentLocation;

  const ErrorScreen({super.key, this.errorMessage, this.currentLocation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () => context.go(RouteNames.splash),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 80, color: Colors.red),
              const SizedBox(height: 24),
              const Text(
                'Oops! Something went wrong',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              if (errorMessage != null) ...[
                Text(
                  errorMessage!,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
              ],
              if (currentLocation != null && kDebugMode) ...[
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Location: $currentLocation',
                    style: const TextStyle(fontSize: 12, fontFamily: 'monospace'),
                  ),
                ),
                const SizedBox(height: 16),
              ],
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () => context.go(RouteNames.splash),
                    icon: const Icon(Icons.home),
                    label: const Text('Go Home'),
                  ),
                  const SizedBox(width: 16),
                  TextButton.icon(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Go Back'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
