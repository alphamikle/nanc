import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TimeMask extends MaskTextInputFormatter {
  TimeMask() : super(mask: _defaultMask, filter: _filter);

  static const String _defaultMask = 'Hh:Mm:Ss';
  static final Map<String, RegExp> _filter = {
    'H': RegExp(r'[0-2]'),
    'h': RegExp(r'\d'),
    'M': RegExp(r'[0-5]'),
    'm': RegExp(r'\d'),
    'S': RegExp(r'[0-5]'),
    's': RegExp(r'\d'),
  };

  void _updateMask(String key, String regExp) {
    final Map<String, RegExp> newFilter = {..._filter};
    newFilter[key] = RegExp(regExp);
    updateMask(filter: newFilter, mask: _defaultMask);
  }

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final List<String> items = newValue.text.replaceAll(':', '').split('');

    /// ? 0X
    if (items.length > 1) {
      final String H = items[0];

      if (H == '0' || H == '1') {
        _updateMask('h', r'\d');
      } else {
        _updateMask('h', r'[0-4]');
      }
    }
    return super.formatEditUpdate(oldValue, newValue);
  }
}
