import 'dart:math';

import 'package:fields/fields.dart';
import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';

import '../kit_tooltip.dart';

const double _kMinColumnWidth = 150;
const double _kRowHeight = 56;

typedef KitTableRowBuilder = Widget Function(BuildContext context, Json data, Widget child);
typedef KitTableCellBuilder = Widget Function(BuildContext context, MapEntry<String, dynamic> cellData);
typedef KitTableHeaderCellBuilder = Widget Function(BuildContext context, Field field);

typedef KitTableRowPressedCallback = void Function(Json rowData);
typedef KitTableCellPressedCallback = void Function(MapEntry<String, dynamic> cellData);
typedef KitTableHeaderCellPressedCallback = void Function(Field field);

class KitTableV2 extends StatelessWidget {
  const KitTableV2({
    required this.model,
    required this.dataRows,
    required this.horizontalScrollController,
    this.columnSizes,
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

  final KitTableRowBuilder? rowBuilder;
  final KitTableCellBuilder? cellBuilder;
  final KitTableHeaderCellBuilder? headerCellBuilder;

  final KitTableRowPressedCallback? onRowPressed;
  final KitTableCellPressedCallback? onCellPressed;
  final KitTableHeaderCellPressedCallback? onHeaderCellPressed;

  List<double> _calculateResultColumnSizes(double totalWidth, int totalColumns) {
    final List<double?> widths = List.generate(totalColumns, (index) => null);
    final List<Field> listFields = model.listFields;
    for (int i = 0; i < listFields.length; i++) {
      final Field field = listFields[i];
      if (columnSizes != null && field.width == null) {
        widths[i] = columnSizes![i];
      } else if (field.width != null) {
        widths[i] = field.width;
      }
    }
    if (widths.every((double? width) => width != null)) {
      widths.removeLast();
      widths.add(null);
    }
    double restOfTheSpace = totalWidth;
    int defaultWidthCount = 0;
    for (final double? width in widths) {
      if (width != null) {
        restOfTheSpace = restOfTheSpace - width;
      } else {
        defaultWidthCount++;
      }
    }
    final List<double> result = [];
    for (final double? width in widths) {
      if (width != null) {
        result.add(width);
      } else {
        result.add(max(restOfTheSpace / defaultWidthCount, _kMinColumnWidth));
      }
    }
    return result;
  }

  Widget _headerCellBuilder(BuildContext context, int index, double columnWidth) {
    final Field field = model.listFields[index];

    return SizedBox(
      height: _kRowHeight,
      width: columnWidth,
      child: ListTile(
        onTap: onHeaderCellPressed == null ? null : () => onHeaderCellPressed!(field),
        title: headerCellBuilder == null
            ? Text(
                field.name,
                style: context.theme.textTheme.titleLarge,
              )
            : headerCellBuilder!(context, field),
      ),
    );
  }

  Widget _cellBuilder(BuildContext context, MapEntry<String, dynamic> cellData, double columnWidth) {
    final Widget child = Align(
      alignment: Alignment.centerLeft,
      child: cellBuilder == null
          ? KitTooltip(
              text: cellData.value.toString(),
              child: Text(
                cellData.value.toString(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          : cellBuilder!(context, cellData),
    );

    if (onCellPressed != null) {
      return SizedBox(
        width: columnWidth,
        child: ListTile(
          onTap: () => onCellPressed!(cellData),
          title: child,
        ),
      );
    }
    return SizedBox(
      width: columnWidth,
      child: child,
    );
  }

  Widget _rowBuilder(BuildContext context, Json rowData, List<double> columnWidth) {
    final List<Field> listFields = model.listFields;
    final List<MapEntry<String, dynamic>> entries = [];
    for (final Field field in listFields) {
      entries.add(MapEntry<String, dynamic>(field.id, rowData[field.id]));
    }

    Widget child = ListView.builder(
      itemBuilder: (BuildContext context, int index) => _cellBuilder(context, entries[index], columnWidth[index]),
      itemCount: listFields.length,
      controller: horizontalScrollController,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.zero,
    );

    child = rowBuilder == null ? child : rowBuilder!(context, rowData, child);

    if (onRowPressed != null) {
      return ListTile(
        minVerticalPadding: 0,
        contentPadding: rowBuilder == null ? null : EdgeInsets.zero,
        onTap: () => onRowPressed!(rowData),
        title: child,
      );
    }
    return child;
  }

  Widget _effectiveRowBuilder(BuildContext context, int index, List<double> columnWidths) {
    final Json rowData = dataRows[index];

    return SizedBox(
      height: _kRowHeight,
      child: _rowBuilder(context, rowData, columnWidths),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double totalWidth = constraints.maxWidth;
        final int totalColumns = model.listFields.length;
        assert(columnSizes == null || columnSizes!.length == totalColumns || columnSizes!.length > totalColumns,
            'Length of columnSizes (${columnSizes?.length}) should be the same, as length of listFields ($totalColumns) of model');
        final List<double> resultColumnSizes = _calculateResultColumnSizes(totalWidth, totalColumns);

        return CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              floating: true,
              delegate: _TableHeaderDelegate(
                child: Material(
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) => _headerCellBuilder(context, index, resultColumnSizes[index]),
                    controller: horizontalScrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: totalColumns,
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) => _effectiveRowBuilder(context, index, resultColumnSizes),
                childCount: dataRows.length,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _TableHeaderDelegate extends SliverPersistentHeaderDelegate {
  _TableHeaderDelegate({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => _kRowHeight;

  @override
  double get minExtent => maxExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}
