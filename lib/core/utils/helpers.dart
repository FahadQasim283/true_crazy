import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Helpers {

  /// Calculate percentage
  static double calculatePercentage(num part, num total) {
    if (total == 0) return 0;
    return (part / total) * 100;
  }

  static void copyToClipboard(BuildContext context, String text, {String? message}) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message ?? 'Copied to clipboard'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  /// Show confirmation dialog
  static Future<bool> showConfirmationDialog(
    BuildContext context, {
    required String title,
    required String content,
    String confirmText = 'Confirm',
    String cancelText = 'Cancel',
  }) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: Text(cancelText)),
          TextButton(onPressed: () => Navigator.of(context).pop(true), child: Text(confirmText)),
        ],
      ),
    );
    return result ?? false;
  }

  /// Show loading dialog
  static void showLoadingDialog(BuildContext context, {String? message}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        content: Row(
          children: [
            const CircularProgressIndicator(),
            const SizedBox(width: 20),
            Text(message ?? 'Loading...'),
          ],
        ),
      ),
    );
  }

  /// Format number with thousand separators
  static String formatNumber(num number) {
    return number.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }
}
