import 'package:intl/intl.dart';

String dateFormat() {
  var now = new DateTime.now();
  var formatter = DateFormat('MMM d,').add_jm();
  String formattedDate = formatter.format(now);
  return formattedDate;
}
