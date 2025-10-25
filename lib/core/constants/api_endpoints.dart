import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiEndpoints {
  ApiEndpoints._();
  static final String _baseUrl = dotenv.env['BASE_URL'] ?? '';
  static String get baseUrl => _baseUrl;
}
