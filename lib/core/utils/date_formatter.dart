import 'package:intl/intl.dart';

class DateFormatter {
  // Formate la date du jour
  static String formatDate([DateTime? date]) {
    final target = date ?? DateTime.now();
    return DateFormat.yMMMMd().format(target);
  }

  // Formate l'heure pour l'historique ou le réveil
  static String formatTime([DateTime? date]) {
    final target = date ?? DateTime.now();
    return DateFormat('HH:mm').format(target);
  }

  // Utile pour vérifier si deux prises d'eau ont eu lieu le même jour
  static bool isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }
}