import 'package:fields/fields.dart';
import 'package:flutter/material.dart';
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
    return KitJsonPreview(
      data: data,
      excludedKeys: [
        field.id,
      ],
    );
  }
}
