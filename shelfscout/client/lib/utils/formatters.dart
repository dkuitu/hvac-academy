import 'package:intl/intl.dart';

class Formatters {
  static String price(double value) {
    return NumberFormat.currency(symbol: '\$', decimalDigits: 2).format(value);
  }

  static String date(DateTime dt) {
    return DateFormat.yMMMd().format(dt);
  }

  static String dateTime(DateTime dt) {
    return DateFormat.yMMMd().add_jm().format(dt);
  }

  static String relativeTime(DateTime dt) {
    final diff = DateTime.now().difference(dt);
    if (diff.inMinutes < 1) return 'just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    if (diff.inDays < 7) return '${diff.inDays}d ago';
    return date(dt);
  }
}
