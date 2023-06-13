import 'package:intl/intl.dart';

String formatUnixDate(int unixDate) {
  DateTime date = DateTime.fromMillisecondsSinceEpoch(unixDate * 1000);
  String formattedDate = DateFormat('dd/MM/yyyy').format(date);
  return formattedDate;
}

String formatUnixTime(int unixTime) {
  DateTime time = DateTime.fromMillisecondsSinceEpoch(unixTime * 1000);
  String formattedTime = DateFormat('hh:mm a').format(time);
  return formattedTime;
}