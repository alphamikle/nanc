import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class DateMask extends MaskTextInputFormatter {
  DateMask() : super(mask: _defaultMask, filter: _filter);

  static const String _defaultMask = 'Yyyy-Mm-Dd';
  static final Map<String, RegExp> _filter = {
    'Y': RegExp(r'\d'),
    'y': RegExp(r'\d'),
    'M': RegExp(r'[0-1]'),
    'm': RegExp(r'\d'),
    'D': RegExp(r'[0-3]'),
    'd': RegExp(r'\d'),
  };

  bool _isLeapYear(int year) {
    if (year % 4 == 0) {
      if (year % 100 == 0) {
        if (year % 400 == 0) {
          return true;
        } else {
          return false;
        }
      } else {
        return true;
      }
    } else {
      return false;
    }
  }

  static const Map<int, String> _numbersMapping = {
    0: 'Y',
    1: 'y',
    2: 'y',
    3: 'y',
    4: 'M',
    5: 'm',
    6: 'D',
    7: 'd',
  };

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    TextEditingValue formattedValue = super.formatEditUpdate(oldValue, newValue);
    final List<String> items = formattedValue.text.replaceAll('-', '').split('');

    /// ? 2022-0X
    if (items.length > 5) {
      final String year = items.sublist(0, 4).join();
      final String M = items[4];
      final String m = items[5];
      final String month = '$M$m';
      if (M == '0' && m == '0') {
        formattedValue = formattedValue.copyWith(
          text: formattedValue.text.replaceAll('$year-$month', '$year-01'),
        );
      }
      if (M == '1') {
        final int intMonth = int.parse(month);
        if (intMonth > 12) {
          formattedValue = formattedValue.copyWith(
            text: formattedValue.text.replaceAll('$year-$month', '$year-12'),
          );
        }
      }
    }

    /// ? 2022-02-X
    if (items.length > 6) {
      final String year = items.sublist(0, 4).join();
      final String M = items[4];
      final String m = items[5];
      final String D = items[6];
      final String month = '$M$m';
      const Set<String> months30 = {'04', '06', '09', '11'};
      if (month == '02' && D == '3') {
        formattedValue = formattedValue.copyWith(
          text: formattedValue.text.replaceAll('$year-$month-$D', '$year-$month-2'),
        );
      }
    }

    /// ? 2022-02-0X
    if (items.length > 7) {
      final String year = items.sublist(0, 4).join();
      final int intYear = int.parse(year);
      final String M = items[4];
      final String m = items[5];
      final String D = items[6];
      final String d = items[7];
      final String month = '$M$m';
      String day = '$D$d';
      final int intDay = int.parse(day);
      const Set<String> months30 = {'04', '06', '09', '11'};

      if (month == '02' && intDay > 28 && _isLeapYear(intYear) == false) {
        day = '28';
      } else if (month == '02' && intDay > 29 && _isLeapYear(intYear)) {
        day = '29';
      } else if (months30.contains(month) && intDay > 30) {
        day = '30';
      } else if (intDay > 31) {
        day = '31';
      } else if (day == '00') {
        day = '01';
      }

      formattedValue = formattedValue.copyWith(
        text: formattedValue.text.replaceAll('$year-$month-$D$d', '$year-$month-$day'),
      );
    }
    return formattedValue;
  }
}
