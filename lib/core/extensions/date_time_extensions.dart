/// DateTime extensions for enhanced date and time manipulation
extension DateTimeExtensions on DateTime {
 
  String get timeAgo {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.isNegative) {
      // Future time
      final futureDifference = this.difference(now);
      if (futureDifference.inMinutes < 1) {
        return 'in a moment';
      } else if (futureDifference.inMinutes < 60) {
        return 'in ${futureDifference.inMinutes} minutes';
      } else if (futureDifference.inHours < 24) {
        return 'in ${futureDifference.inHours} hours';
      } else if (futureDifference.inDays < 7) {
        return 'in ${futureDifference.inDays} days';
      } else if (futureDifference.inDays < 30) {
        final weeks = (futureDifference.inDays / 7).floor();
        return 'in $weeks ${weeks == 1 ? 'week' : 'weeks'}';
      } else if (futureDifference.inDays < 365) {
        final months = (futureDifference.inDays / 30).floor();
        return 'in $months ${months == 1 ? 'month' : 'months'}';
      } else {
        final years = (futureDifference.inDays / 365).floor();
        return 'in $years ${years == 1 ? 'year' : 'years'}';
      }
    } else {
      // Past time
      if (difference.inMinutes < 1) {
        return 'just now';
      } else if (difference.inMinutes < 60) {
        return '${difference.inMinutes} minutes ago';
      } else if (difference.inHours < 24) {
        return '${difference.inHours} hours ago';
      } else if (difference.inDays < 7) {
        return '${difference.inDays} days ago';
      } else if (difference.inDays < 30) {
        final weeks = (difference.inDays / 7).floor();
        return '$weeks ${weeks == 1 ? 'week' : 'weeks'} ago';
      } else if (difference.inDays < 365) {
        final months = (difference.inDays / 30).floor();
        return '$months ${months == 1 ? 'month' : 'months'} ago';
      } else {
        final years = (difference.inDays / 365).floor();
        return '$years ${years == 1 ? 'year' : 'years'} ago';
      }
    }
  }
}
