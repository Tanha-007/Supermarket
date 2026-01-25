import 'package:intl/intl.dart';

class AppHelpers {
  // Format currency
  static String formatCurrency(double amount) {
    return '৳${amount.toStringAsFixed(0)}';
  }

  // Format date
  static String formatDate(DateTime date, {String format = 'dd MMM yyyy'}) {
    return DateFormat(format).format(date);
  }

  // Format time
  static String formatTime(DateTime time, {String format = 'hh:mm a'}) {
    return DateFormat(format).format(time);
  }

  // Format date time
  static String formatDateTime(DateTime dateTime, {String format = 'dd MMM yyyy hh:mm a'}) {
    return DateFormat(format).format(dateTime);
  }

  // Get relative time (e.g., "2 hours ago")
  static String getRelativeTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inSeconds < 60) {
      return 'just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
    } else {
      return formatDate(dateTime);
    }
  }

  // Calculate average rating
  static double calculateAverageRating(List<double> ratings) {
    if (ratings.isEmpty) return 0.0;
    return ratings.reduce((a, b) => a + b) / ratings.length;
  }

  // Truncate string
  static String truncateString(String str, int length) {
    return str.length > length ? '${str.substring(0, length)}...' : str;
  }

  // Get initials from name
  static String getInitials(String name) {
    final parts = name.split(' ');
    return parts.map((part) => part[0].toUpperCase()).join();
  }

  // Calculate distance (simple formula)
  static double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    // Simple Haversine formula (simplified)
    final dLat = (lat2 - lat1) * 0.0174533;
    final dLon = (lon2 - lon1) * 0.0174533;
    final a = (dLat / 2).sin() * (dLat / 2).sin() +
        (lat1 * 0.0174533).cos() * (lat2 * 0.0174533).cos() * (dLon / 2).sin() * (dLon / 2).sin();
    return 12742 * (2 * a.asin().atan2((1 - a).sqrt())); // Distance in km
  }

  // Validate email
  static bool isValidEmail(String email) {
    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return regex.hasMatch(email);
  }

  // Validate phone
  static bool isValidPhone(String phone) {
    final regex = RegExp(r'^(\+880|0)[1-9]\d{8}$');
    return regex.hasMatch(phone);
  }

  // Validate NID
  static bool isValidNID(String nid) {
    return nid.length == 13 && int.tryParse(nid) != null;
  }
}
