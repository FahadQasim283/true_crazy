class RouteParams {
  RouteParams._();

  static const String orderId = 'orderId';
  static const String orderStatus = 'orderStatus';

  static const String restaurantId = 'restaurantId';
  static const String restaurantName = 'restaurantName';
  static const String restaurantCategory = 'category';

  static const String menuItemId = 'menuItemId';
  static const String menuCategory = 'menuCategory';

  static const String searchQuery = 'query';
  static const String searchCategory = 'category';
  static const String searchLocation = 'location';

  static const String userId = 'userId';
  static const String profileSection = 'section';

  static const String notificationId = 'notificationId';
  static const String notificationType = 'type';

  static const String paymentMethodId = 'paymentMethodId';
  static const String transactionId = 'transactionId';

  static const String addressId = 'addressId';
  static const String addressType = 'type';

  static const String deepLinkSource = 'source';
  static const String deepLinkCampaign = 'campaign';

  static bool isValidOrderId(String? id) {
    return id != null && id.isNotEmpty && RegExp(r'^[a-zA-Z0-9_-]+$').hasMatch(id);
  }

  static bool isValidRestaurantId(String? id) {
    return id != null && id.isNotEmpty && RegExp(r'^[a-zA-Z0-9_-]+$').hasMatch(id);
  }

  static bool isValidMenuItemId(String? id) {
    return id != null && id.isNotEmpty && RegExp(r'^[a-zA-Z0-9_-]+$').hasMatch(id);
  }

  static bool isValidUserId(String? id) {
    return id != null && id.isNotEmpty && RegExp(r'^[a-zA-Z0-9_-]+$').hasMatch(id);
  }
}

class OrderRouteParams {
  final String orderId;
  final String? orderStatus;

  const OrderRouteParams({required this.orderId, this.orderStatus});

  Map<String, String> toMap() {
    final map = <String, String>{RouteParams.orderId: orderId};

    if (orderStatus != null) {
      map[RouteParams.orderStatus] = orderStatus!;
    }

    return map;
  }

  factory OrderRouteParams.fromMap(Map<String, String> params) {
    return OrderRouteParams(
      orderId: params[RouteParams.orderId] ?? '',
      orderStatus: params[RouteParams.orderStatus],
    );
  }
}

class RestaurantRouteParams {
  final String restaurantId;
  final String? restaurantName;
  final String? category;

  const RestaurantRouteParams({required this.restaurantId, this.restaurantName, this.category});

  Map<String, String> toMap() {
    final map = <String, String>{RouteParams.restaurantId: restaurantId};

    if (restaurantName != null) {
      map[RouteParams.restaurantName] = restaurantName!;
    }

    if (category != null) {
      map[RouteParams.restaurantCategory] = category!;
    }

    return map;
  }

  factory RestaurantRouteParams.fromMap(Map<String, String> params) {
    return RestaurantRouteParams(
      restaurantId: params[RouteParams.restaurantId] ?? '',
      restaurantName: params[RouteParams.restaurantName],
      category: params[RouteParams.restaurantCategory],
    );
  }
}

class SearchRouteParams {
  final String? query;
  final String? category;
  final String? location;

  const SearchRouteParams({this.query, this.category, this.location});

  Map<String, String> toMap() {
    final map = <String, String>{};

    if (query != null && query!.isNotEmpty) {
      map[RouteParams.searchQuery] = query!;
    }

    if (category != null && category!.isNotEmpty) {
      map[RouteParams.searchCategory] = category!;
    }

    if (location != null && location!.isNotEmpty) {
      map[RouteParams.searchLocation] = location!;
    }

    return map;
  }

  factory SearchRouteParams.fromMap(Map<String, String> params) {
    return SearchRouteParams(
      query: params[RouteParams.searchQuery],
      category: params[RouteParams.searchCategory],
      location: params[RouteParams.searchLocation],
    );
  }
}
