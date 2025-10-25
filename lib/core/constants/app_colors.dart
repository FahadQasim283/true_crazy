import 'package:flutter/material.dart';

/// App colors extracted from the True Crazy brand icon
/// Color palette: Purple, Orange, Cyan, Yellow - vibrant and energetic
class AppColors {
  AppColors._();

  // ==================== PRIMARY COLORS ====================
  /// Main brand color - Purple/Magenta from icon
  static const Color primary = Color(0xFF9C27B0); // Purple
  static const Color primaryDark = Color(0xFF7B1FA2); // Darker purple
  static const Color primaryLight = Color(0xFFBA68C8); // Lighter purple

  // ==================== SECONDARY COLORS ====================
  /// Secondary brand color - Orange/Coral from icon
  static const Color secondary = Color(0xFFFF7043); // Coral orange
  static const Color secondaryDark = Color(0xFFE64A19); // Darker orange
  static const Color secondaryLight = Color(0xFFFF8A65); // Lighter orange

  // ==================== ACCENT COLORS ====================
  /// Accent colors from icon for variety
  static const Color accentCyan = Color(0xFF00BCD4); // Cyan from icon
  static const Color accentYellow = Color(0xFFFDD835); // Yellow from icon
  static const Color accentLime = Color(0xFFCDDC39); // Lime from icon
  static const Color accentPink = Color(0xFFE91E63); // Pink accent

  // ==================== GRADIENT COLORS ====================
  /// Gradients matching the icon's vibrant style
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF9C27B0), Color(0xFFE91E63)], // Purple to Pink
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [Color(0xFFFF7043), Color(0xFFFDD835)], // Orange to Yellow
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient coolGradient = LinearGradient(
    colors: [Color(0xFF00BCD4), Color(0xFF9C27B0)], // Cyan to Purple
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // ==================== NEUTRAL COLORS ====================
  /// Background colors
  static const Color background = Color(0xFFFAFAFA);
  static const Color backgroundDark = Color(0xFF121212);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFF1E1E1E);

  /// Card colors
  static const Color cardLight = Color(0xFFFFFFFF);
  static const Color cardDark = Color(0xFF2C2C2C);

  // ==================== TEXT COLORS ====================
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textHint = Color(0xFFBDBDBD);
  static const Color textOnPrimary = Color(0xFFFFFFFF);
  static const Color textOnSecondary = Color(0xFFFFFFFF);

  // Dark mode text
  static const Color textPrimaryDark = Color(0xFFFFFFFF);
  static const Color textSecondaryDark = Color(0xFFB0B0B0);
  static const Color textHintDark = Color(0xFF757575);

  // ==================== FUNCTIONAL COLORS ====================
  /// Success color
  static const Color success = Color(0xFF4CAF50);
  static const Color successLight = Color(0xFF81C784);
  static const Color successDark = Color(0xFF388E3C);

  /// Error color
  static const Color error = Color(0xFFE53935);
  static const Color errorLight = Color(0xFFEF5350);
  static const Color errorDark = Color(0xFFC62828);

  /// Warning color
  static const Color warning = Color(0xFFFFA726);
  static const Color warningLight = Color(0xFFFFB74D);
  static const Color warningDark = Color(0xFFF57C00);

  /// Info color
  static const Color info = Color(0xFF29B6F6);
  static const Color infoLight = Color(0xFF4FC3F7);
  static const Color infoDark = Color(0xFF0288D1);

  // ==================== DATING APP SPECIFIC ====================
  /// Like/Heart color (for swipe right)
  static const Color like = Color(0xFF4CAF50); // Green heart
  static const LinearGradient likeGradient = LinearGradient(
    colors: [Color(0xFF66BB6A), Color(0xFF81C784)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Nope/Pass color (for swipe left)
  static const Color nope = Color(0xFFE53935); // Red X
  static const LinearGradient nopeGradient = LinearGradient(
    colors: [Color(0xFFE53935), Color(0xFFEF5350)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Super like color (for swipe up)
  static const Color superLike = Color(0xFF00BCD4); // Cyan star
  static const LinearGradient superLikeGradient = LinearGradient(
    colors: [Color(0xFF00BCD4), Color(0xFF26C6DA)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Match color
  static const Color match = Color(0xFFFF7043); // Orange (from icon)

  /// Online indicator
  static const Color online = Color(0xFF4CAF50);
  static const Color offline = Color(0xFF9E9E9E);

  /// Verified badge
  static const Color verified = Color(0xFF00BCD4);

  // ==================== DIVIDERS & BORDERS ====================
  static const Color divider = Color(0xFFE0E0E0);
  static const Color dividerDark = Color(0xFF424242);
  static const Color border = Color(0xFFBDBDBD);
  static const Color borderDark = Color(0xFF616161);

  // ==================== OPACITY VARIATIONS ====================
  /// For overlays and shadows
  static Color black10 = Colors.black.withOpacity(0.1);
  static Color black20 = Colors.black.withOpacity(0.2);
  static Color black50 = Colors.black.withOpacity(0.5);
  static Color white10 = Colors.white.withOpacity(0.1);
  static Color white20 = Colors.white.withOpacity(0.2);
  static Color white50 = Colors.white.withOpacity(0.5);

  /// Shimmer effect colors
  static const Color shimmerBase = Color(0xFFE0E0E0);
  static const Color shimmerHighlight = Color(0xFFF5F5F5);
}
