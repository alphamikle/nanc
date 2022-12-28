import 'package:flutter/material.dart';
import 'package:ui_kit/src/components/kit_not_found_text.dart';

class KitNotFoundModelById extends StatelessWidget {
  const KitNotFoundModelById({
    required this.modelId,
    super.key,
  });

  final String modelId;

  @override
  Widget build(BuildContext context) {
    return KitNotFoundText(text: 'TODO: NOT FOUND ENTITY BY ID "$modelId"');
  }
}
