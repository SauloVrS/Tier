import 'package:intl/intl.dart';


String getFormatedDate(_date) {
  var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
  var inputDate = inputFormat.parse(_date.toString());
  var outputFormat = DateFormat('d MMMM, yyyy');
  return outputFormat.format(inputDate);
}