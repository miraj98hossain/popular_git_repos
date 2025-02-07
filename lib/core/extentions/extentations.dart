import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DarkMode on BuildContext {
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}

extension FormatDateTime on DateTime {
  String toFormatedString(String pattern) {
    try {
      return DateFormat(pattern).format(this);
    } catch (e) {
      return "";
    }
  }
}

extension CalculateAge on DateTime {
  List<int> calculateAge() {
    try {
      DateTime now = DateTime.now();
      int years = now.year - year;
      int months = now.month - month;
      int days = now.day - day;

      // Adjust if the current month/day is before the birth month/day
      if (months < 0 || (months == 0 && days < 0)) {
        years--;
        months += 12;
      }
      if (days < 0) {
        final previousMonth = DateTime(now.year, now.month - 1, 0);
        days += previousMonth.day;
        months--;
      }

      return [years, months, days];
    } catch (e) {
      return [0, 0, 0];
    }
  }
}
