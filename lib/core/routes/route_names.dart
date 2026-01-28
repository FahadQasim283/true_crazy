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

  // Feature routes
  static const String influencers = '/influencers';
  static const String influencerDetails = '/influencer-details';
  static const String events = '/events';
  static const String settings = '/settings';

  // static String orderDetailsWithId(String orderId) => '/order-details/$orderId';
  // static String restaurantDetailsWithId(String restaurantId) => '/restaurant-details/$restaurantId';
  // static String menuItemWithId(String itemId) => '/menu-item/$itemId';
  // static String tipWithOrderId(String orderId) => '/tip/$orderId';

  // Helper methods for routes with parameters
  static String influencerDetailsWithId(String id) => '$influencerDetails/$id';
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
