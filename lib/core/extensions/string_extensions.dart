/// String extensions for enhanced string manipulation
extension StringExtensions on String {
  String get capitalize {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  /// Check if string is valid email
  bool get isValidEmail {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this);
  }

  /// Check if string is valid URL
  bool get isValidUrl {
    return RegExp(r'^https?://(?:[-\w.])+(?:\:[0-9]+)?(?:/(?:[\w/_.])*(?:\?(?:[\w&=%.])*)?(?:\#(?:[\w.])*)?)?$').hasMatch(this);
  }

  /// Check if string is valid phone number
  bool get isValidPhone {
    return RegExp(r'^\+?[\d\s\-\(\)]{10,}$').hasMatch(this);
  }

  /// Remove all whitespace
  String get removeAllWhitespace {
    return replaceAll(RegExp(r'\s+'), '');
  }

}
