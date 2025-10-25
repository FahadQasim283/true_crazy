import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width;

  double get screenHeight => MediaQuery.sizeOf(this).height;

  EdgeInsets get safeAreaPadding => MediaQuery.paddingOf(this);

  bool get isTablet => screenWidth >= 768;

  bool get isMobile => screenWidth < 768;

  TextTheme get textTheme => Theme.of(this).textTheme;

  void unfocus() {
    FocusScope.of(this).unfocus();
  }

  void requestFocus(FocusNode focusNode) {
    FocusScope.of(this).requestFocus(focusNode);
  }
}
