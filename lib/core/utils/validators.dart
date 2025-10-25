/// Form validation utilities for DevSyncKit
class Validators {
  Validators._();

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }

    bool hasUppercase = value.contains(RegExp(r'[A-Z]'));
    bool hasLowercase = value.contains(RegExp(r'[a-z]'));
    bool hasDigits = value.contains(RegExp(r'[0-9]'));
    bool hasSpecialCharacters = value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

    if (!hasUppercase) {
      return 'Password must contain at least one uppercase letter';
    }

    if (!hasLowercase) {
      return 'Password must contain at least one lowercase letter';
    }

    if (!hasDigits) {
      return 'Password must contain at least one number';
    }

    if (!hasSpecialCharacters) {
      return 'Password must contain at least one special character';
    }

    return null;
  }

  /// Validate confirm password
  static String? confirmPassword(String? value, String? originalPassword) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }

    if (value != originalPassword) {
      return 'Passwords do not match';
    }

    return null;
  }
}
