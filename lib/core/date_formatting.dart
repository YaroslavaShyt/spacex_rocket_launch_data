import 'package:intl/intl.dart';

String formatUnixDate(String unixDate) {
  DateTime date = DateTime.parse(unixDate);
  String formattedDate = DateFormat('dd/MM/yyyy').format(date);
  return formattedDate;
}

String formatUnixTime(String unixTime) {
  DateTime time = DateTime.parse(unixTime);
  String formattedTime = DateFormat('hh:mm a').format(time);
  return formattedTime;
}
