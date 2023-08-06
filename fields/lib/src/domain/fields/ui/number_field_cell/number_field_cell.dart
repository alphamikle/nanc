import 'package:flutter/material.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

import '../../logic/number_field/number_field.dart';
import '../field_cell_mixin.dart';

final BigInt minSignedBigInt = BigInt.parse('-9223372036854775808');
final BigInt maxSignedBigInt = BigInt.parse('9223372036854775807');
final BigInt maxUnsignedBigInt = BigInt.parse('18446744073709551615');

class NumberFieldCell extends FieldCellWidget<NumberField> {
  const NumberFieldCell({
    required super.field,
    required super.creationMode,
    super.key,
  });

  @override
  State<NumberFieldCell> createState() => _NumberFieldCellState();
}

class _NumberFieldCellState extends State<NumberFieldCell> with FieldCellHelper<NumberField, NumberFieldCell> {
  String get placeholder {
    return switch ((field.numberType, field.signType)) {
      (NumberType.bit, SignType.signed) => '0...1',
      (NumberType.bit, SignType.unsigned) => '0...1',
      (NumberType.float, SignType.signed) => '-1234###.56###...1234###.56###',
      (NumberType.float, SignType.unsigned) => '1234###.56###',
      (NumberType.double, SignType.signed) => '-1234###.56###...1234###.56###',
      (NumberType.double, SignType.unsigned) => '1234###.56###',
      (NumberType.tinyInt, SignType.signed) => '-128...127',
      (NumberType.tinyInt, SignType.unsigned) => '0...255',
      (NumberType.smallInt, SignType.signed) => '-32 768...32 767',
      (NumberType.smallInt, SignType.unsigned) => '0...65 535',
      (NumberType.mediumInt, SignType.signed) => '-8 388 608...8 388 607',
      (NumberType.mediumInt, SignType.unsigned) => '0...16 777 215',
      (NumberType.integer, SignType.signed) => '-2 147 483 648...2 147 483 647',
      (NumberType.integer, SignType.unsigned) => '0...4 294 967 295',
      (NumberType.bigInt, SignType.signed) => '-2^63...2^63-1',
      (NumberType.bigInt, SignType.unsigned) => '0...2^64-1',
    };
  }

  String? fieldValidator(String? value) {
    if (field.validator != null) {
      return field.validator!(value);
    }
    return null;
  }

  String? numberValidator(String? value) {
    if (value == null || value.trim() == '') {
      return null;
    }

    final NumberType type = field.numberType;
    final SignType sign = field.signType;
    final bool isIntType = type.isFloat == false && type.isDouble == false;
    final bool isMinus = value.trim().startsWith('-');

    if (isIntType && value.contains(RegExp(r'[,.]'))) {
      return 'Value should be integer';
    }

    if (isMinus && (sign.isUnsigned || type.isBit)) {
      return 'Value should be >= 0';
    }

    if (isIntType) {
      final (int? possiblyInt, NumberParsingErrorType? error, String? message) = detailedIntFromString(value);

      late final int integer;
      late final BigInt bigInt;
      final bool outOfLimitError = error != null && error.isOutOfLimit;

      if (outOfLimitError) {
        bigInt = BigInt.parse(value);
      } else if (message != null) {
        return message;
      } else if (possiblyInt != null) {
        integer = possiblyInt;
      } else {
        return 'Invalid integer';
      }

      /// ? BIT IS BIT
      if (type.isBit && (outOfLimitError || integer > 1)) {
        return 'Bit should be 0 or 1';
      }

      /// ? TINY INT
      if (type.isTinyInt) {
        if (sign.isSigned && (outOfLimitError || (integer < -128 || integer > 127))) {
          return 'Signed tiny int should be in a range -128...127';
        }
        if (sign.isUnsigned && (outOfLimitError || integer > 255)) {
          return 'Unsigned tiny int should be in a range 0...255';
        }
        return null;
      }

      /// ? SMALL INT
      if (type.isSmallInt) {
        if (sign.isSigned && (outOfLimitError || (integer < -32768 || integer > 32767))) {
          return 'Signed small int should be in a range -32 768...32 767';
        }
        if (sign.isUnsigned && (outOfLimitError || integer > 65535)) {
          return 'Unsigned small int should be in a range 0...65 535';
        }
        return null;
      }

      /// ? MEDIUM INT
      if (type.isMediumInt) {
        if (sign.isSigned && (outOfLimitError || (integer < -8388608 || integer > 8388607))) {
          return 'Signed medium int should be in a range -8 388 608...8 388 607';
        }
        if (sign.isUnsigned && (outOfLimitError || integer > 16777215)) {
          return 'Unsigned medium int should be in a range 0...16 777 215';
        }
        return null;
      }

      /// ? INTEGER
      if (type.isInteger) {
        if (sign.isSigned && (outOfLimitError || (integer < -2147483648 || integer > 2147483647))) {
          return 'Signed integer should be in a range -2 147 483 648...2 147 483 647';
        }
        if (sign.isUnsigned && (outOfLimitError || integer > 4294967295)) {
          return 'Unsigned integer should be in a range 0...4 294 967 295';
        }
        return null;
      }

      /// ? BIG INT
      if (type.isBigInt) {
        if (sign.isSigned && outOfLimitError && (bigInt < minSignedBigInt || bigInt > maxSignedBigInt)) {
          return 'Signed integer should be in a range -2^63...2^63-1';
        }
        if (sign.isUnsigned && outOfLimitError && bigInt > maxUnsignedBigInt) {
          return 'Unsigned integer should be in a range 0...2^64-1';
        }
        return null;
      }
      return null;
    }

    final (double? possiblyDouble, NumberParsingErrorType? error, String? message) = detailedDoubleFromString(value);

    if (possiblyDouble == null) {
      if (error != null && error.isOutOfLimit) {
        return 'Floating point number is infinite';
      }
      return message ?? 'Invalid floating number';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return KitNumberField(
      controller: controller,
      helper: helper,
      placeholder: placeholder,
      onChanged: (Object? newValue) => pageBloc.updateValue(fieldId, newValue is BigInt ? newValue.toString() : newValue),
      isChanged: pageBloc.fieldWasChanged(fieldId),
      validator: groupOfValidators([
        numberValidator,
        if (field.validator != null) fieldValidator,
      ]),
      isRequired: field.isRequired,
    );
  }
}

// 2147483648
