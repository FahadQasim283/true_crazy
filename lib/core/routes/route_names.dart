class RouteNames {
  RouteNames._();

  static const String root = '/';
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';

  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';
  

  // Main tab and bottom nav routes
  static const String mainTab = '/main';
  static const String home = 'home';
 
  // static String orderDetailsWithId(String orderId) => '/order-details/$orderId';
  // static String restaurantDetailsWithId(String restaurantId) => '/restaurant-details/$restaurantId';
  // static String menuItemWithId(String itemId) => '/menu-item/$itemId';
  // static String tipWithOrderId(String orderId) => '/tip/$orderId';
}

extension RouteNameExtension on String {
  String get name {
    if (startsWith('/')) {
      return substring(1);
    }
    return this;
  }

  bool get isValidRoute {
    return startsWith('/') && length > 1;
  }

  List<String> get segments {
    if (!startsWith('/')) return [];
    return substring(1).split('/').where((s) => s.isNotEmpty).toList();
  }
}
