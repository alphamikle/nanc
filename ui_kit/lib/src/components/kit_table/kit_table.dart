import 'package:cms/cms.dart' show Routes;
import 'package:fields/fields.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';

import '../../constants/gap.dart';
import 'kit_table_cell.dart';
import 'kit_table_header.dart';

typedef CellBuilder = Widget Function(Field field, dynamic value);
typedef OnRowPressed = void Function(Model entity);

class KitTable extends StatelessWidget {
  const KitTable({
    required this.entities,
    required this.entity,
    this.cellBuilder,
    this.onRowPressed,
    super.key,
  });

  final List<Json> entities;
  final Model entity;
  final CellBuilder? cellBuilder;
  final OnRowPressed? onRowPressed;

  List<Field> get allColumns => entity.listFields;

  Widget buildRow(BuildContext context, int index) {
    final Json json = entities[index];
    final Widget row = ListTile(
      title: Row(
        children: [
          for (int i = 0; i < allColumns.length; i++)
            Expanded(
              child: EntityTableCell(
                field: allColumns[i],
                value: json[allColumns[i].id],
              ),
            ),
        ],
      ),
      onTap: () => context.go(Routes.pageOfCollectionModel(entity.id, (json['id'] ?? '').toString())),
    );
    if (index == entities.length - 1) {
      return Padding(
        padding: const EdgeInsets.only(bottom: Gap.regular),
        child: row,
      );
    }
    if (index == 0) {
      return Padding(
        padding: const EdgeInsets.only(top: Gap.regular),
        child: row,
      );
    }
    return row;
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          delegate: _TableHeaderDelegate(
            child: ColoredBox(
              color: Theme.of(context).cardColor,
              child: KitTableHeader(
                entity: entity,
              ),
            ),
          ),
          floating: true,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            buildRow,
            childCount: entities.length,
          ),
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
  double get maxExtent => 55;

  @override
  double get minExtent => maxExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}
