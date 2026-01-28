import 'package:flutter/material.dart';
import '../extensions/textstyle_extensions.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle _base() => const TextStyle(fontFamily: 'Poppins');

  static TextStyle heading(BuildContext context) => _base()
      .withFontSize(20)
      .withFontWeight(FontWeight.w700)
      .withFontColor(Theme.of(context).colorScheme.onSurface);

  static TextStyle title(BuildContext context) => _base()
      .withFontSize(16)
      .withFontWeight(FontWeight.w600)
      .withFontColor(Theme.of(context).colorScheme.onSurface);

  static TextStyle body(BuildContext context) => _base()
      .withFontSize(14)
      .withFontWeight(FontWeight.w400)
      .withFontColor(Theme.of(context).colorScheme.onSurface);

  static TextStyle small(BuildContext context) => _base()
      .withFontSize(12)
      .withFontWeight(FontWeight.w400)
      .withFontColor(Theme.of(context).colorScheme.onSurface.withOpacity(0.7));
}


class AppTextStyleAccessor {
  final BuildContext _context;
  const AppTextStyleAccessor(this._context);
  TextStyle get heading => AppTextStyles.heading(_context);
  TextStyle get title => AppTextStyles.title(_context);
  TextStyle get body => AppTextStyles.body(_context);
  TextStyle get small => AppTextStyles.small(_context);
}
