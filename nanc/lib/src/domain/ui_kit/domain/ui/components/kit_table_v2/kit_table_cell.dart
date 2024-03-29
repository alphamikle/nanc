import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:tools/tools.dart';

import '../../../../../field/logic/fields/color_field/color_field.dart';
import '../../../../../field/logic/fields/dynamic_field/dynamic_field.dart';
import '../../../../../field/logic/fields/field/field.dart';
import '../../../../../field/logic/fields/icon_field/icon_field.dart';
import '../../../../../field/logic/fields/multi_selector_field/multi_selector_field.dart';
import '../../../../../field/logic/fields/structured_field/structured_field.dart';
import '../../../../../field/logic/tools/field_types_extension.dart';
import '../../../logic/constants/gap.dart';
import '../kit_text.dart';
import '../kit_tooltip.dart';

final RegExp _zeroReplacer = RegExp(r'\.?0+$');
const double _colorSize = 25;

class KitTableCell extends StatelessWidget {
  const KitTableCell({
    required this.cellData,
    required this.field,
    required this.columnWidth,
    super.key,
  });

  final MapEntry<String, dynamic> cellData;
  final Field field;
  final double columnWidth;

  dynamic get value => cellData.value;
  bool get isValueNull => value == null;

  String textValue() {
    if (field is MultiSelectorField) {
      return '[id]';
    }
    if (isValueNull) {
      return 'null';
    }
    if (field is DynamicField) {
      return '[Json]';
    } else if (field is StructuredField) {
      if ((field as StructuredField).singleObject) {
        return 'Json';
      } else {
        return '[Json]';
      }
    }
    if (field.isString) {
      // TODO(alphamikle): Here is a some bug with int-value inside of StringField
      if (value is! String) {
        return value.toString();
      }
      return value as String;
    } else if (field.isNumeric) {
      final (isInt, processedValue) = _isInt(value);
      if (isInt) {
        return processedValue.toString();
      }
      return (processedValue as double).toStringAsFixed(5).replaceFirst(_zeroReplacer, '');
    }
    return value.toString();
  }

  @override
  Widget build(BuildContext context) {
    final String text = textValue();
    final bool needToShowTooltip = text.length * 8.5 > columnWidth;
    Widget cell = KitText(
      text: text,
      style: context.theme.textTheme.bodyMedium?.copyWith(height: 1),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
    if (field is ColorField) {
      cell = Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: Gap.regular),
            child: Container(
              width: _colorSize,
              height: _colorSize,
              decoration: BoxDecoration(
                color: colorFromHex(text) ?? Colors.transparent,
                borderRadius: BorderRadius.circular(Gap.regular),
              ),
            ),
          ),
          cell,
        ],
      );
    } else if (field is IconField) {
      cell = Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: Gap.regular),
            child: Icon(
              IconsStorage.tryToGetIconByName(text),
            ),
          ),
          cell,
        ],
      );
    }

    if (needToShowTooltip) {
      return KitTooltip(
        text: text,
        child: cell,
      );
    }
    return cell;
  }
}

(bool, num) _isInt(num value) {
  if (value is int) {
    return (true, value);
  }
  final int truncated = value.truncate();
  final num diff = value - truncated;
  final bool isInt = diff == 0;
  return (isInt, isInt ? truncated : value);
}
