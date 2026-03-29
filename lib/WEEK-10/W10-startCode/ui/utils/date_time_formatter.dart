import 'package:intl/intl.dart';

class DateFormatter {
  /// Mar 29, 2026 • 03:00 PM
  static String formatDateTime(DateTime date) {
    return DateFormat('MMM dd, yyyy • hh:mm a').format(date);
  }
}
