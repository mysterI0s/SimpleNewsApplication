import 'package:intl/intl.dart';

String formatDate(String dateString) {
  DateTime dateTime = DateTime.parse(dateString);

  String formattedDate = DateFormat('MMM d, yyyy').format(dateTime);

  return formattedDate;
}
