class TimesAgo {
  static String convert(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inSeconds < 60) {
      int seconds = difference.inSeconds;
      return "$seconds second${seconds == 1 ? '' : 's'} ago";
    } else if (difference.inMinutes < 60) {
      int minutes = difference.inMinutes;
      return "$minutes minute${minutes == 1 ? '' : 's'} ago";
    } else if (difference.inHours < 24) {
      int hours = difference.inHours;
      return "$hours hour${hours == 1 ? '' : 's'} ago";
    } else if (difference.inDays < 7) {
      int days = difference.inDays;
      return "$days day${days == 1 ? '' : 's'} ago";
    } else if (difference.inDays < 30) {
      int weeks = (difference.inDays / 7).floor();
      return "$weeks week${weeks == 1 ? '' : 's'} ago";
    } else if (difference.inDays < 365) {
      int months = (difference.inDays / 30).floor();
      return "$months month${months == 1 ? '' : 's'} ago";
    } else {
      int years = (difference.inDays / 365).floor();
      return "$years year${years == 1 ? '' : 's'} ago";
    }
  }
}
