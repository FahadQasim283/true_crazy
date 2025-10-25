import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiEndpoints {
  ApiEndpoints._();
  static final String _baseUrl = dotenv.env['BASE_URL'] ?? '';
  static String get baseUrl => _baseUrl;
  
  static final String login = '$_baseUrl/api/login';
  static final String register = '$_baseUrl/api/register';
  static final String logout = '$_baseUrl/api/logout';
}