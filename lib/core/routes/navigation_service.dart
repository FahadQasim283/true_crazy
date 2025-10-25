import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'route_names.dart';
import 'route_config.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static BuildContext? get currentContext => navigatorKey.currentContext;

  static void goToSplash() {
    GoRouter.of(currentContext!).go(RouteNames.splash);
  }

  static void goToOnboarding() {
    GoRouter.of(currentContext!).go(RouteNames.onboarding);
  }

  static void goToLogin() {
    GoRouter.of(currentContext!).go(RouteNames.login);
  }

  static void goToRegister() {
    GoRouter.of(currentContext!).go(RouteNames.register);
  }

  static void goToForgotPassword() {
    GoRouter.of(currentContext!).go(RouteNames.forgotPassword);
  }


  // static void goToRestaurantDetails(String restaurantId) {
  //   if (!RouteParams.isValidRestaurantId(restaurantId)) {
  //     throw ArgumentError('Invalid restaurant ID: $restaurantId');
  //   }
  //   GoRouter.of(currentContext!).go(RouteNames.restaurantDetailsWithId(restaurantId));
  // }

  static void goToSearch({String? query, String? category, String? location}) {
    // final params = SearchRouteParams(query: query, category: category, location: location);

    // final uri = Uri(path: RouteNames.search, queryParameters: params.toMap());

    // GoRouter.of(currentContext!).go(uri.toString());
  }


  static void push(String routePath) {
    if (!RouteConfig.isValidRoutePath(routePath)) {
      throw ArgumentError('Invalid route path: $routePath');
    }
    GoRouter.of(currentContext!).push(routePath);
  }

  static void pushNamed(String routeName, {Map<String, String>? pathParameters}) {
    GoRouter.of(currentContext!).pushNamed(routeName, pathParameters: pathParameters ?? {});
  }

  static void pop([dynamic result]) {
    GoRouter.of(currentContext!).pop(result);
  }

  static bool canPop() {
    return GoRouter.of(currentContext!).canPop();
  }

  static void popUntil(String routePath) {
    while (canPop() &&
        GoRouter.of(currentContext!).routerDelegate.currentConfiguration.fullPath != routePath) {
      pop();
    }
  }

  static void pushReplacement(String routePath) {
    if (!RouteConfig.isValidRoutePath(routePath)) {
      throw ArgumentError('Invalid route path: $routePath');
    }
    GoRouter.of(currentContext!).pushReplacement(routePath);
  }

  static void goAndClearStack(String routePath) {
    if (!RouteConfig.isValidRoutePath(routePath)) {
      throw ArgumentError('Invalid route path: $routePath');
    }
    GoRouter.of(currentContext!).go(routePath);
  }

  static Future<T?> showNavigationBottomSheet<T>({
    required Widget child,
    bool isDismissible = true,
    bool enableDrag = true,
  }) {
    return showModalBottomSheet<T>(
      context: currentContext!,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => child,
    );
  }

  static Future<T?> showNavigationDialog<T>({
    required Widget child,
    bool barrierDismissible = true,
  }) {
    return showDialog<T>(
      context: currentContext!,
      barrierDismissible: barrierDismissible,
      builder: (context) => child,
    );
  }

  static String? getCurrentRoute() {
    final GoRouter router = GoRouter.of(currentContext!);
    return router.routerDelegate.currentConfiguration.fullPath;
  }

  static bool currentRouteRequiresAuth() {
    final currentRoute = getCurrentRoute();
    if (currentRoute == null) return false;
    return RouteConfig.requiresAuth(currentRoute);
  }

  static void logNavigation(String action, String route) {
    if (currentContext != null) {
      debugPrint('Navigation: $action -> $route');
    }
  }
}
