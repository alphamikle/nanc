import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

final RegExp _allowedSymbolRegExp = RegExp(r'[\dA-Fa-f]');

class HexTextMask extends MaskTextInputFormatter {
  HexTextMask()
      : super(
          mask: '#NNNNNNNN',
          filter: {
            'N': _allowedSymbolRegExp,
          },
        );

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    TextEditingValue output = super.formatEditUpdate(oldValue, newValue);

    /// ? Here, we in the situation, when default formatted drop the value to ""
    if (output.text.isEmpty) {
      final List<String> resultSymbols = oldValue.text.split('');
      final List<String> diff = newValue.text.replaceAll(oldValue.text, '').split('');
      for (final String char in diff) {
        if (_allowedSymbolRegExp.hasMatch(char)) {
          resultSymbols.add(char);
        }
      }
      output = output.copyWith(text: resultSymbols.join());
    }
    return output.copyWith(text: output.text.toUpperCase());
  }
}
