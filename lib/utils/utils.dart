import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:attendanceapp/models/log_model.dart';

class Utils {
  static int get getNowInMillisecond => DateTime.now().millisecondsSinceEpoch;

  static int get getTodayInMillisecond {
    DateTime today = DateTime.now();
    return DateTime(
      today.year,
      today.month,
      today.day,
    ).millisecondsSinceEpoch;
  }

  static String get getNewDocId {
    return Firestore.instance.collection('').document().documentID;
  }

  static double calculateHoursForSingleDay(List<LogModel> logs,
      {String unit = 'hours'}) {
    List<Duration> pairs = createPairsFromList(logs);
    double timeInSeconds = pairs.fold(0, (previousValue, element) {
      return previousValue + element.inSeconds;
    });
    switch (unit) {
      case 'hours':
        {
          return double.parse((timeInSeconds / (60 * 60)).toStringAsFixed(2));
        }

      case 'minutes':
        {
          return double.parse((timeInSeconds / (60)).toStringAsFixed(2));
        }

      case 'seconds':
        {
          return double.parse((timeInSeconds / (1)).toStringAsFixed(2));
        }
    }
  }

  static List<Duration> createPairsFromList(List<LogModel> logs) {
    return logs.map((value) {
//    Duration diff;
      int index = logs.indexOf(value);
      int nextElementIndex = logs.indexOf(value) + 1;
      if (logs.length != nextElementIndex) {
        return value
            .getDateWithMinutes()
            .difference(logs[nextElementIndex].getDateWithMinutes());
      } else {
        return Duration.zero;
      }
    }).toList();
  }
}
