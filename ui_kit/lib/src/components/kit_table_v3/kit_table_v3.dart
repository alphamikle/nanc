import 'package:fields/fields.dart';
import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';

import 'kit_table_source.dart';

const double _kMinColumnWidth = 150;
const double _kRowHeight = 56;

typedef KitTableRowBuilder = Widget Function(BuildContext context, Json data, Widget child);
typedef KitTableCellBuilder = Widget Function(BuildContext context, MapEntry<String, dynamic> cellData);
typedef KitTableHeaderCellBuilder = Widget Function(BuildContext context, Field field);

typedef KitTableRowPressedCallback = void Function(Json rowData);
typedef KitTableCellPressedCallback = void Function(MapEntry<String, dynamic> cellData);
typedef KitTableHeaderCellPressedCallback = void Function(Field field);

class KitTableV3 extends StatefulWidget {
  const KitTableV3({
    required this.model,
    required this.dataRows,
    required this.horizontalScrollController,
    this.columnSizes,
    this.restorationId,
    this.rowBuilder,
    this.cellBuilder,
    this.headerCellBuilder,
    this.onRowPressed,
    this.onCellPressed,
    this.onHeaderCellPressed,
    super.key,
  })  : assert(onRowPressed != null || onCellPressed != null),
        assert(onRowPressed == null || onCellPressed == null);

  final Model model;
  final List<Json> dataRows;
  final ScrollController horizontalScrollController;
  final List<double?>? columnSizes;
  final String? restorationId;

  final KitTableRowBuilder? rowBuilder;
  final KitTableCellBuilder? cellBuilder;
  final KitTableHeaderCellBuilder? headerCellBuilder;

  final KitTableRowPressedCallback? onRowPressed;
  final KitTableCellPressedCallback? onCellPressed;
  final KitTableHeaderCellPressedCallback? onHeaderCellPressed;

  @override
  State<KitTableV3> createState() => _KitTableV3State();
}

class _KitTableV3State extends State<KitTableV3> {
  late final List<DataColumn> columns = (() {
    final List<DataColumn> result = [];
    for (final Field field in widget.model.listFields) {
      final DataColumn column = DataColumn(
        label: Text(field.name),
        numeric: field is NumberField,
        onSort: onSort,
      );
      result.add(column);
    }
    return result;
  })();

  late KitTableSource source = KitTableSource(model: widget.model, data: widget.dataRows);

  void onSort(int columnIndex, bool ascending) {
    print('ON SORT: $columnIndex; $ascending');
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.dataRows.isEmpty) {
      return const SizedBox.shrink();
    }
    return DefaultTextStyle(
      style: const TextStyle(height: 1),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          print('H: ${constraints.minHeight}');

          return PaginatedDataTable(
            source: source,
            columns: columns,
            rowsPerPage: (constraints.maxHeight - 114) ~/ kMinInteractiveDimension,
          );
        },
      ),
    );
  }
}
