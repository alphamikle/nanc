import 'package:flutter/material.dart';
import 'package:nanc_fields/nanc_fields.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

class PageDataPreview extends StatelessWidget {
  const PageDataPreview({
    required this.field,
    required this.data,
    super.key,
  });

  final Field field;
  final Json data;

  @override
  Widget build(BuildContext context) {
    final String? binaryScreenFieldId = field is ScreenField ? (field as ScreenField).binaryDataFieldId : null;

    return KitJsonPreview(
      data: data,
      excludedKeys: {
        field.id,
        RegExp(kStructureKey),
        if (binaryScreenFieldId != null && binaryScreenFieldId.isNotEmpty) binaryScreenFieldId,
      },
    );
  }
}
