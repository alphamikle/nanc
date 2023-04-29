import 'package:fields/fields.dart';
import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';

class KitTableSource extends DataTableSource {
  KitTableSource({
    required this.model,
    required this.data,
  });

  final Model model;
  final List<Json> data;

  @override
  DataRow? getRow(int index) {
    final Json rowData = data[index];

    return DataRow(
      cells: transformRowData(rowData),
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;

  List<DataCell> transformRowData(Json rowData) {
    final List<DataCell> cells = [];
    for (final Field field in model.listFields) {
      final dynamic value = rowData[field.id];
      final DataCell cell = DataCell(Text(value.toString()));
      cells.add(cell);
    }
    return cells;
  }
}
