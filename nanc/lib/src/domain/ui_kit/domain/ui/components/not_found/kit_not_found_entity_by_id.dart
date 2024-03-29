import 'package:flutter/material.dart';

import '../kit_centered_text.dart';

class KitNotFoundModelById extends StatelessWidget {
  const KitNotFoundModelById({
    required this.modelId,
    super.key,
  });

  final String modelId;

  @override
  Widget build(BuildContext context) {
    return KitCenteredText(text: 'TODO: NOT FOUND ENTITY BY ID "$modelId"');
  }
}
