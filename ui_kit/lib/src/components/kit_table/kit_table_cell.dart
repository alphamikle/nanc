import 'package:fields/fields.dart';
import 'package:flutter/material.dart';

import '../kit_text.dart';

class EntityTableCell extends StatelessWidget {
  const EntityTableCell({
    required this.field,
    required this.value,
    super.key,
  });

  final Field field;
  final dynamic value;

  @override
  Widget build(BuildContext context) {
    return KitText(text: '$value');
  }
}
