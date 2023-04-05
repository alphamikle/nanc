import 'package:fields/fields.dart';
import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'kit_table_header_cell.dart';

class KitTableHeader extends StatelessWidget {
  const KitTableHeader({
    required this.entity,
    super.key,
  });

  final Model entity;

  @override
  Widget build(BuildContext context) {
    final List<Field> fields = entity.listFields;

    return Row(
      children: [
        for (int i = 0; i < fields.length; i++)
          Expanded(
            child: KitTableHeaderCell(
              isFirst: i == 0,
              isLast: i == fields.length - 1,
              field: fields[i],
            ),
          ),
      ],
    );
  }
}
