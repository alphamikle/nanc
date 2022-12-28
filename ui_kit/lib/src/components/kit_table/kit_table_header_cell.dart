import 'package:fields/fields.dart';
import 'package:flutter/material.dart';

class KitTableHeaderCell extends StatelessWidget {
  const KitTableHeaderCell({
    required this.field,
    required this.isFirst,
    required this.isLast,
    super.key,
  });

  final Field field;
  final bool isFirst;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final BorderSide border = BorderSide(color: Colors.black.withOpacity(0.075));

    return DecoratedBox(
      decoration: BoxDecoration(
        border: BorderDirectional(
          end: isLast ? BorderSide.none : border,
          bottom: border,
        ),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: ListTile(
          title: Text(field.name),
          onTap: () {},
        ),
      ),
    );
  }
}
