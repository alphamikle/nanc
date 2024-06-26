import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:nanc_configuration/nanc_configuration.dart';
import 'package:nanc_icons/nanc_icons.dart';
import 'package:nanc_tools/nanc_tools.dart';
import 'package:super_sliver_list/super_sliver_list.dart';

import '../../../../../field/logic/fields/field/field.dart';
import '../../../../../model/logic/model/logic/model.dart';
import '../../../logic/constants/gap.dart';
import '../kit_text.dart';
import 'kit_table_cell.dart';
import 'popups/kit_table_popup_button.dart';
import 'size_adjuster.dart';
import 'table_paginator.dart';

const double _kMinColumnWidth = 220;
const double _kRowHeight = 52;

typedef KitTableRowBuilder = Widget Function(BuildContext context, Json data, Widget child);
typedef KitTableCellBuilder = Widget Function(BuildContext context, MapEntry<String, dynamic> cellData);
typedef KitTableHeaderCellBuilder = Widget Function(BuildContext context, Field field);

typedef KitTableRowPressedCallback = void Function(Json rowData);
typedef KitTableCellPressedCallback = void Function(MapEntry<String, dynamic> cellData);
typedef KitTableHeaderCellPressedCallback = void Function(Field field);
typedef OnPagination = Future<void> Function(int pageNumber);

class KitTableV2 extends StatefulWidget {
  const KitTableV2({
    required this.model,
    required this.dataRows,
    required this.currentPage,
    required this.totalPages,
    this.columnSizes,
    this.restorationId,
    this.rowBuilder,
    this.cellBuilder,
    this.headerCellBuilder,
    this.onRowPressed,
    this.onCellPressed,
    this.onHeaderCellPressed,
    this.onPagination,
    this.onSort,
    this.scrollController,
    this.paginationEnabled = true,
    this.selectedSort,
    this.onResize,
    this.initialSizes,
    this.perPage = 50,
    super.key,
  })  : assert(onRowPressed != null || onCellPressed != null),
        assert(onRowPressed == null || onCellPressed == null);

  final Model model;
  final List<Json> dataRows;
  final List<double?>? columnSizes;
  final String? restorationId;
  final int currentPage;
  final int totalPages;
  final bool paginationEnabled;
  final Sort? selectedSort;
  final ScrollController? scrollController;
  final Map<int, double>? initialSizes;
  final int perPage;

  final KitTableRowBuilder? rowBuilder;
  final KitTableCellBuilder? cellBuilder;
  final KitTableHeaderCellBuilder? headerCellBuilder;

  final KitTableRowPressedCallback? onRowPressed;
  final KitTableCellPressedCallback? onCellPressed;
  final KitTableHeaderCellPressedCallback? onHeaderCellPressed;
  final OnPagination? onPagination;
  final SortingCallback? onSort;
  final ColumnsResizingCallback? onResize;

  @override
  State<KitTableV2> createState() => _KitTableV2State();
}

class _KitTableV2State extends State<KitTableV2> {
  late final Map<int, double> columnSizes = widget.initialSizes ?? {};
  final Map<int, ScrollController> horizontalScrollControllers = {};
  late final ScrollController headerScrollController = scrollControllersGroup.addAndGet();
  final LinkedScrollControllerGroup scrollControllersGroup = LinkedScrollControllerGroup();
  final ScrollController tableScrollController = ScrollController();
  final StreamController<double> paginatorPositionStreamController = StreamController();
  final StreamController<bool> paginatorPinnedStatusController = StreamController();

  bool get paginationEnabled => widget.paginationEnabled;

  double prevDiff = 0;
  double prevOffset = Gap.large;
  late int currentPage = widget.currentPage;
  late int totalPages = widget.totalPages;
  bool paginatorPinned = false;

  void resizeColumn(int columnIndex, double diff) {
    safeSetState(() {
      final double oldSize = columnSizes[columnIndex] ?? _kMinColumnWidth;
      final double newSize = max(oldSize + diff, _kMinColumnWidth / 2);
      columnSizes[columnIndex] = newSize;
      widget.onResize?.call(columnSizes);
    });
  }

  void togglePin() {
    paginatorPinned = !paginatorPinned;
    paginatorPinnedStatusController.add(paginatorPinned);
  }

  Widget _headerCellBuilder(BuildContext context, int index, double columnWidth) {
    final Field field = widget.model.listFields[index];
    final bool isCurrentSorted = widget.selectedSort?.fieldId == field.id;
    final bool isCurrentSortedDesc = isCurrentSorted && widget.selectedSort?.order == Order.desc;

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
                  ? KitText(
                      text: field.name,
                      style: context.theme.textTheme.titleMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  : widget.headerCellBuilder!(context, field),
            ),
          ),
          if (widget.onSort != null)
            Padding(
              padding: const EdgeInsets.only(right: Gap.small),
              child: KitTablePopupButton(
                field: field,
                onSort: widget.onSort!,
                selectedSort: widget.selectedSort,
                child: AnimatedCrossFade(
                  crossFadeState: isCurrentSorted ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 250),
                  firstChild: Icon(
                    IconPack.flu_text_align_justify_filled,
                    color: context.theme.colorScheme.surfaceTint.withOpacity(isCurrentSorted ? 1 : 0.35),
                    size: 20,
                  ),
                  secondChild: AnimatedCrossFade(
                    crossFadeState: isCurrentSortedDesc ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                    duration: const Duration(milliseconds: 250),
                    firstChild: Icon(
                      IconPack.mdi_sort_reverse_variant,
                      color: context.theme.colorScheme.surfaceTint.withOpacity(isCurrentSorted ? 1 : 0.35),
                      size: 20,
                    ),
                    secondChild: Icon(
                      IconPack.mdi_sort_variant,
                      color: context.theme.colorScheme.surfaceTint.withOpacity(isCurrentSorted ? 1 : 0.35),
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
          SizeAdjuster(
            resizingCallback: (double diff) => resizeColumn(index, diff),
          ),
        ],
      ),
    );
  }

  Widget _cellBuilder(BuildContext context, MapEntry<String, dynamic> cellData, Field field, double columnWidth) {
    Widget child = Align(
      alignment: Alignment.centerLeft,
      child: widget.cellBuilder == null
          ? KitTableCell(
              cellData: cellData,
              field: field,
              columnWidth: columnWidth,
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
      itemBuilder: (BuildContext context, int index) => _cellBuilder(context, entries[index], listFields[index], columnSizes[index] ?? _kMinColumnWidth),
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
        dense: true,
      );
    }
    return SizedBox(
      height: _kRowHeight,
      child: child,
    );
  }

  void paginationHandler(int pageNumber) {
    if (widget.onPagination != null) {
      safeSetState(() {
        currentPage = pageNumber;
        if (currentPage < 1) {
          currentPage = 1;
        } else if (currentPage > totalPages) {
          currentPage = totalPages;
        }
      });
      unawaited(
        widget.onPagination!(currentPage).then(
          (_) async {
            if (tableScrollController.hasClients == false) {
              return;
            }

            return tableScrollController.animateTo(
              0,
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
            );
          },
        ),
      );
    }
  }

  void initColumnSizes() {
    if (widget.initialSizes == null || widget.initialSizes!.isEmpty) {
      int index = 0;
      if (widget.columnSizes?.isNotEmpty ?? false) {
        for (final double? size in widget.columnSizes!) {
          columnSizes[index] = size ?? _kMinColumnWidth;
          index++;
        }
      } else {
        for (final Field _ in widget.model.listFields) {
          columnSizes[index] = _kMinColumnWidth;
          index++;
        }
      }
    }
  }

  void adjustPaginatorPosition() {
    final double diff = tableScrollController.offset - prevDiff;
    prevDiff = tableScrollController.offset;
    if (diff > 0 && paginatorPinned) {
      return;
    }
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
    if (paginationEnabled) {
      tableScrollController.addListener(adjustPaginatorPosition);
    }
  }

  @override
  void didUpdateWidget(KitTableV2 oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget != widget) {
      currentPage = widget.currentPage;
      totalPages = widget.totalPages;
    }
  }

  @override
  void dispose() {
    if (paginationEnabled) {
      tableScrollController.removeListener(adjustPaginatorPosition);
    }
    tableScrollController.dispose();
    unawaited(paginatorPositionStreamController.close());
    unawaited(paginatorPinnedStatusController.close());
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
              if (widget.dataRows.isNotEmpty)
                SliverPersistentHeader(
                  floating: true,
                  delegate: _TableHeaderDelegate(
                    height: _kRowHeight + 5,
                    child: Material(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 3,
                              color: context.theme.colorScheme.surfaceVariant,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 3),
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
                  ),
                ),
              if (widget.dataRows.isNotEmpty)
                SuperSliverList(
                  extentEstimation: (int index, double crossAxisExtent) => _kRowHeight,
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) => _rowBuilder(context, index),
                    childCount: widget.dataRows.length,
                  ),
                ),
            ],
          ),
        ),
        if (paginationEnabled)
          StreamBuilder<double>(
            stream: paginatorPositionStreamController.stream,
            builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
              return Positioned(
                right: Gap.large,
                bottom: snapshot.data ?? Gap.large,
                child: StreamBuilder<bool>(
                  stream: paginatorPinnedStatusController.stream,
                  builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                    return TablePaginator(
                      currentPage: currentPage,
                      pinned: snapshot.data ?? false,
                      onPin: togglePin,
                      perPage: widget.perPage,
                      totalPages: totalPages,
                      onPagination: paginationHandler,
                    );
                  },
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
    this.height = _kRowHeight,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  final double height;

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}
