import 'package:intl/intl.dart';

class TimeUtil{
  static String getFormattedTime(DateTime time){
    return DateFormat.Hm().format(time);
  }
}