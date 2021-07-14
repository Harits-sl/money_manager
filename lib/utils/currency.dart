import 'package:intl/intl.dart';

currencyFormat(cash) {
  var f = NumberFormat('#,##0', 'ID');
  return f.format(cash);
}
