import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UHelperFunctions {
  UHelperFunctions._();

  // Dark Mode
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  // Given a string => Return a Color
  static Color? getColor(String value) {
    if (value == 'Green') {
      return Colors.green;
    }
    if (value == 'Red') {
      return Colors.red;
    }
    if (value == 'Blue') {
      return Colors.blue;
    }
    if (value == 'Pink') {
      return Colors.pink;
    }
    if (value == 'Yellow') {
      return Colors.yellow;
    }
    if (value == 'Black') {
      return Colors.black;
    }
    if (value == 'White') {
      return Colors.white;
    }
    if (value == 'Purple') {
      return Colors.purple;
    }
    if (value == 'Orange') {
      return Colors.orange;
    }
    if (value == 'Brown') {
      return Colors.brown;
    }
    if (value == 'Grey') {
      return Colors.grey;
    }
    if (value == 'Lime') {
      return Colors.lime;
    }
    if (value == 'Amber') {
      return Colors.amber;
    }

    return null;
  }

  static String getFormattedDate(DateTime date,
      {String format = 'dd MMM yyy'}) {
    return DateFormat(format).format(date);
  }

  // Return the date of Monday (start of week) given a date
  static DateTime getStartOfWeek(DateTime date) {
    final int daysUntilMonday = date.weekday - 1;
    final DateTime startOfWeek = date.subtract(Duration(days: daysUntilMonday));

    return DateTime(
        startOfWeek.year, startOfWeek.month, startOfWeek.day, 1, 0, 0, 0, 0);
  }

  // Maximum of list of doubles
  static maxOfDouble(List<double> list) {
    double temp = 0.0;

    for (double n in list) {
      if (n > temp) temp = n;
    }

    return temp;
  }
}
