import 'package:flutter/material.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle heading(BuildContext context) => TextStyle(
    fontFamily: 'Poppins',
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: Theme.of(context).colorScheme.onSurface,
  );

  static TextStyle title(BuildContext context) => TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Theme.of(context).colorScheme.onSurface,
  );

  static TextStyle body(BuildContext context) => TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Theme.of(context).colorScheme.onSurface,
  );

  static TextStyle small(BuildContext context) => TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
  );
}
