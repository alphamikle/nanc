import 'package:flutter/material.dart';
import 'package:tools/tools.dart';

import '../../../field/logic/fields/dynamic_field/structure_model.dart';
import '../../../field/logic/fields/field/field.dart';
import '../../../field/logic/fields/screen_field/screen_field.dart';
import '../../../ui_kit/domain/ui/components/kit_code_preview/kit_json_preview.dart';

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
