import 'dart:async';
import 'dart:math';

import 'package:fields/fields.dart';
import 'package:flutter/material.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';

import '../../constants/gap.dart';
import '../kit_tooltip.dart';
import 'size_adjuster.dart';
import 'table_paginator.dart';

const double _kMinColumnWidth = 140;
const double _kRowHeight = 48;

typedef KitTableRowBuilder = Widget Function(BuildContext context, Json data, Widget child);
typedef KitTableCellBuilder = Widget Function(BuildContext context, MapEntry<String, dynamic> cellData);
typedef KitTableHeaderCellBuilder = Widget Function(BuildContext context, Field field);

typedef KitTableRowPressedCallback = void Function(Json rowData);
typedef KitTableCellPressedCallback = void Function(MapEntry<String, dynamic> cellData);
typedef KitTableHeaderCellPressedCallback = void Function(Field field);

class KitTableV2 extends StatefulWidget {
  const KitTableV2({
    required this.model,
    required this.dataRows,
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
  final List<double?>? columnSizes;
  final String? restorationId;

  final KitTableRowBuilder? rowBuilder;
  final KitTableCellBuilder? cellBuilder;
  final KitTableHeaderCellBuilder? headerCellBuilder;

  final KitTableRowPressedCallback? onRowPressed;
  final KitTableCellPressedCallback? onCellPressed;
  final KitTableHeaderCellPressedCallback? onHeaderCellPressed;

  @override
  State<KitTableV2> createState() => _KitTableV2State();
}

class _KitTableV2State extends State<KitTableV2> {
  final Map<int, double> columnSizes = {};
  final Map<int, ScrollController> horizontalScrollControllers = {};
  late final ScrollController headerScrollController = scrollControllersGroup.addAndGet();
  final LinkedScrollControllerGroup scrollControllersGroup = LinkedScrollControllerGroup();
  final ScrollController tableScrollController = ScrollController();
  final StreamController<double> paginatorPositionStreamController = StreamController();
  double prevDiff = 0;
  double prevOffset = Gap.large;

  /// ? TEMP
  int currentPage = 1;
  int totalPages = 12;
  int perPage = 20;

  void resizeColumn(int columnIndex, double diff) {
    safeSetState(() {
      final double oldSize = columnSizes[columnIndex] ?? _kMinColumnWidth;
      final double newSize = max(oldSize + diff, _kMinColumnWidth / 2);
      columnSizes[columnIndex] = newSize;
    });
  }

  Widget _headerCellBuilder(BuildContext context, int index, double columnWidth) {
    final Field field = widget.model.listFields[index];

    return SizedBox(
      height: _kRowHeight,
      width: columnWidth,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: ListTile(
              onTap: widget.onHeaderCellPressed == null ? null : () => widget.onHeaderCellPressed!(field),
              title: widget.headerCellBuilder == null
                  ? Text(
                      field.name,
                      style: context.theme.textTheme.titleMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  : widget.headerCellBuilder!(context, field),
            ),
          ),
          SizeAdjuster(
            resizingCallback: (double diff) => resizeColumn(index, diff),
          ),
        ],
      ),
    );
  }

  Widget _cellBuilder(BuildContext context, MapEntry<String, dynamic> cellData, double columnWidth) {
    Widget child = Align(
      alignment: Alignment.centerLeft,
      child: widget.cellBuilder == null
          ? KitTooltip(
              text: cellData.value.toString(),
              child: Text(
                cellData.value.toString(),
                style: context.theme.textTheme.bodyMedium?.copyWith(height: 1),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          : widget.cellBuilder!(context, cellData),
    );

    if (widget.onCellPressed != null) {
      child = ListTile(
        onTap: () => widget.onCellPressed!(cellData),
        title: child,
      );
    }
    return SizedBox(
      width: columnWidth,
      child: child,
    );
  }

  Widget _rowBuilder(BuildContext context, int index) {
    final Json rowData = widget.dataRows[index];
    final List<Field> listFields = widget.model.listFields;
    final List<MapEntry<String, dynamic>> entries = [];
    for (final Field field in listFields) {
      entries.add(MapEntry<String, dynamic>(field.id, rowData[field.id]));
    }

    final int scrollIndex = index % 100;
    if (horizontalScrollControllers.containsKey(scrollIndex) == false) {
      horizontalScrollControllers[scrollIndex] = scrollControllersGroup.addAndGet();
    }
    final ScrollController scrollController = horizontalScrollControllers[scrollIndex]!;

    Widget child = ListView.builder(
      itemBuilder: (BuildContext context, int index) => _cellBuilder(context, entries[index], columnSizes[index] ?? _kMinColumnWidth),
      itemCount: listFields.length,
      controller: scrollController,
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.zero,
    );

    child = widget.rowBuilder == null ? child : widget.rowBuilder!(context, rowData, child);

    if (widget.onRowPressed != null) {
      child = ListTile(
        minVerticalPadding: 0,
        contentPadding: widget.rowBuilder == null ? null : EdgeInsets.zero,
        onTap: () => widget.onRowPressed!(rowData),
        title: child,
      );
    }
    return SizedBox(
      height: _kRowHeight,
      child: child,
    );
  }

  void goToPageWithNumber(int pageNumber) {
    safeSetState(() {
      currentPage = pageNumber;
      if (currentPage < 1) {
        currentPage = 1;
      } else if (currentPage > totalPages) {
        currentPage = totalPages;
      }
    });
  }

  void initColumnSizes() {
    int index = 0;
    if (widget.columnSizes?.isNotEmpty ?? false) {
      for (final double? size in widget.columnSizes!) {
        columnSizes[index] = size ?? _kMinColumnWidth;
        index++;
      }
    } else {
      for (final Field field in widget.model.listFields) {
        columnSizes[index] = field.width ?? _kMinColumnWidth;
        index++;
      }
    }
  }

  void adjustPaginatorPosition() {
    final double diff = tableScrollController.offset - prevDiff;
    prevDiff = tableScrollController.offset;
    double paginatorBottomOffset = prevOffset - diff;
    if (paginatorBottomOffset < -kPaginatorHeight) {
      paginatorBottomOffset = -kPaginatorHeight;
    } else if (paginatorBottomOffset > Gap.large) {
      paginatorBottomOffset = Gap.large;
    }
    if (paginatorBottomOffset != prevOffset) {
      paginatorPositionStreamController.add(paginatorBottomOffset);
      prevOffset = paginatorBottomOffset;
    }
  }

  void initPaginator() {
    tableScrollController.addListener(adjustPaginatorPosition);
  }

  @override
  void dispose() {
    tableScrollController.dispose();
    unawaited(paginatorPositionStreamController.close());
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    initColumnSizes();
    initPaginator();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: CustomScrollView(
            restorationId: widget.restorationId,
            controller: tableScrollController,
            slivers: [
              SliverPersistentHeader(
                floating: true,
                delegate: _TableHeaderDelegate(
                  child: Material(
                    child: ListView.builder(
                      itemBuilder: (BuildContext context, int index) => _headerCellBuilder(
                        context,
                        index,
                        columnSizes[index] ?? _kMinColumnWidth,
                      ),
                      controller: headerScrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.model.listFields.length,
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) => _rowBuilder(context, index),
                  childCount: widget.dataRows.length,
                ),
              ),
            ],
          ),
        ),
        StreamBuilder<double>(
          stream: paginatorPositionStreamController.stream,
          builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
            return Positioned(
              right: Gap.large,
              bottom: snapshot.data ?? Gap.large,
              child: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) => TablePaginator(
                  currentPage: currentPage,
                  perPage: perPage,
                  totalPages: totalPages,
                  onPageNumberPressed: goToPageWithNumber,
                ),
              ),
            );
          },
        ),
      ],
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
