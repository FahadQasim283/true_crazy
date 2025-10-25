import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RoutingService {
  static const String _baseUrl = 'https://maps.googleapis.com/maps/api/directions/json';
  final Dio _dio = Dio();

  // Get API key from environment file
  String get _apiKey => dotenv.env['GOOGLE_MAPS_API_KEY'] ?? '';

  Future<RouteData> getRoute({
    required LatLng origin,
    required LatLng destination,
    String travelMode = 'driving',
  }) async {
    // Check if API key is available
    if (_apiKey.isEmpty) {
      throw Exception('Google Maps API key not found in environment file');
    }

    try {
      final response = await _dio.get(
        _baseUrl,
        queryParameters: {
          'origin': '${origin.latitude},${origin.longitude}',
          'destination': '${destination.latitude},${destination.longitude}',
          'mode': travelMode,
          'key': _apiKey,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data;

        if (data['status'] == 'OK' && data['routes'].isNotEmpty) {
          final route = data['routes'][0];
          final leg = route['legs'][0];

          // Decode the polyline points
          final encodedPolyline = route['overview_polyline']['points'];
          final routePoints = _decodePolyline(encodedPolyline);

          return RouteData(
            points: routePoints,
            distance: leg['distance']['text'],
            duration: leg['duration']['text'],
            distanceValue: leg['distance']['value'],
            durationValue: leg['duration']['value'],
          );
        } else {
          throw Exception('No route found: ${data['status']}');
        }
      } else {
        throw Exception('Failed to fetch route: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error getting route: $e');
    }
  }

  // Polyline decoding algorithm
  List<LatLng> _decodePolyline(String encoded) {
    List<LatLng> points = [];
    int index = 0;
    int len = encoded.length;
    int lat = 0;
    int lng = 0;

    while (index < len) {
      int b;
      int shift = 0;
      int result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lat += dlat;

      shift = 0;
      result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lng += dlng;

      points.add(LatLng(lat / 1E5, lng / 1E5));
    }

    return points;
  }

  // Alternative method using curved path approximation (fallback if no API key)
  List<LatLng> getSimpleRoute(LatLng origin, LatLng destination, {int points = 50}) {
    final List<LatLng> routePoints = [];

    // Create a slightly curved path to simulate road-like routing
    for (int i = 0; i <= points; i++) {
      final t = i / points;

      // Add some curvature to make it look more like a road
      final curve = 0.0001 * (4 * t * (1 - t)); // Simple curve factor

      final lat = origin.latitude + (destination.latitude - origin.latitude) * t + curve;
      final lng = origin.longitude + (destination.longitude - origin.longitude) * t + curve;

      routePoints.add(LatLng(lat, lng));
    }

    return routePoints;
  }
}

class RouteData {
  final List<LatLng> points;
  final String distance;
  final String duration;
  final int distanceValue; // in meters
  final int durationValue; // in seconds

  RouteData({
    required this.points,
    required this.distance,
    required this.duration,
    required this.distanceValue,
    required this.durationValue,
  });
}
