import 'package:base_app/helper/constants/constant.dart';
import 'package:base_app/helper/utils/app_util.dart';
import 'package:intl/intl.dart';

extension IntExt on int {
  DateTime get dateTime {
    return DateTime.fromMillisecondsSinceEpoch(this);
  }

  bool get isToday {
    final now = DateTime.now();
    return now.day == dateTime.day &&
        now.month == dateTime.month &&
        now.year == dateTime.year;
  }

  int get dateFirstDay {
    return AppUtil.updateDate(date: dateTime, day: 1).millisecondsSinceEpoch;
  }

  int get dateLastDay {
    var day = DateTime(dateTime.year, dateTime.month + 1, 0).day;
    return AppUtil.updateDate(date: dateTime, day: day).millisecondsSinceEpoch;
  }

  int get dateFirstDayOfYear {
    return AppUtil.updateDate(date: dateTime, month: 1, day: 1)
        .millisecondsSinceEpoch;
  }

  int get dateLastDayOfYear {
    var day = DateTime(dateTime.year + 1, 1, 0).day;
    return AppUtil.updateDate(date: dateTime, month: 12, day: day)
        .millisecondsSinceEpoch;
  }

  int get earlyHour {
    return AppUtil.updateDate(
      date: dateTime,
      hour: 0,
      minute: 0,
      second: 0,
    ).millisecondsSinceEpoch;
  }

  int get lateHour {
    return AppUtil.updateDate(
      date: dateTime,
      hour: 23,
      minute: 59,
      second: 59,
    ).millisecondsSinceEpoch;
  }

  bool isSameMinute(int date) {
    return dateTime.year == date.dateTime.year &&
        dateTime.month == date.dateTime.month &&
        dateTime.day == date.dateTime.day &&
        dateTime.hour == date.dateTime.hour &&
        dateTime.minute == date.dateTime.minute;
  }

  String dateFormat(String format) {
    if (this == 0) return AppString.dash;
    return DateFormat(format, 'id').format(dateTime);
  }

  String indexToLetters() {
    var index = this;
    if (index <= 0) return AppString.empty;
    const lettersDic = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    if (index < 27) return lettersDic[index - 1];
    var letters = <String>[];
    do {
      index -= 1;
      letters.add(lettersDic[index.remainder(26)]);
      index ~/= 26;
    } while (index > 0);
    return letters.reversed.join("");
  }

  double percentPrevious(int previous) {
    return this == 0
        ? 0
        : previous == 0
            ? 100
            : (this / previous) * 100;
  }
}
