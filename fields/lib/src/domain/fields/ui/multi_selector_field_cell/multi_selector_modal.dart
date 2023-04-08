import 'dart:async';

import 'package:cms/cms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

import '../../../../../fields.dart';
import '../../../../service/tools/complex_title_tools.dart';

class MultiSelectorModal extends StatefulWidget {
  const MultiSelectorModal({
    required this.field,
    required this.selectedIds,
    super.key,
  });

  final MultiSelectorField field;
  final List<String> selectedIds;

  @override
  State<MultiSelectorModal> createState() => _MultiSelectorModalState();
}

class _MultiSelectorModalState extends State<MultiSelectorModal> {
  MultiSelectorField get field => widget.field;
  Timer? searchDebounce;
  final TextEditingController searchController = TextEditingController();
  final ScrollController tableScrollController = ScrollController();
  final Set<String> selectedIds = {};
  final List<Json> foundRows = [];
  bool isLoading = false;

  Model get shortChildEntity {
    final List<Field> childFields = [];
    final Field? idField = field.model.fieldById(field.model.idField.id);
    final List<Field> titleFields = field.titleFields.toFieldsIds().map((String fieldId) => field.model.fieldById(fieldId)).whereNotNull().toList();
    if (idField != null) {
      childFields.add(idField);
    }
    childFields.addAll(titleFields);
    return field.model.copyWith(fields: [childFields]);
  }

  Future<void> finder({bool immediately = false}) async {
    safeSetState(() => isLoading = true);
    searchDebounce?.cancel();
    searchDebounce = Timer(immediately ? Duration.zero : const Duration(milliseconds: 500), () async {
      if (mounted) {
        final PageListProviderInterface provider = context.read<PageListProviderInterface>();
        final List<QueryParameterValue> values =
            splitComplexTitle(query: searchController.text, titleFields: field.titleFields).map((String it) => QueryStringValue(it)).toList();

        final List<Json> data = await provider.fetchPageList(
          model: field.model,
          subset: [
            field.model.idField.id,
            ...field.titleFields.toFieldsIds(),
          ],
          query: QueryDto(
            multipleValues: field.titleFields.toFieldsIds().map((String it) => QueryMultipleParameter(name: it, values: values)).toList(),
          ),
          params: ParamsDto(
            page: 1,
            limit: 50,
            sort: Sort(field: field.model.idField.id, order: Order.asc),
          ),
        );
        foundRows.clear();
        foundRows.addAll(data);
        searchDebounce = null;
        safeSetState(() => isLoading = false);
      }
    });
  }

  Future<void> init() async {
    selectedIds.clear();
    selectedIds.addAll(widget.selectedIds);
    foundRows.clear();
    searchController.addListener(finder);
    await finder(immediately: true);
  }

  void toggleRow(Json rowData) {
    final String id = rowData[field.model.idField.id].toString();
    if (selectedIds.contains(id)) {
      selectedIds.remove(id);
    } else {
      selectedIds.add(id);
    }
    safeSetState();
  }

  Widget rowBuilder(BuildContext context, Json rowData, Widget child) {
    final String id = rowData[field.model.idField.id].toString();
    final bool isSelected = selectedIds.contains(id);

    return ListTile(
      minVerticalPadding: 0,
      selected: isSelected,
      selectedTileColor: context.theme.colorScheme.tertiary.withOpacity(0.1),
      title: child,
    );
  }

  Widget cellBuilder(BuildContext context, MapEntry<String, dynamic> cellData) {
    final Widget child = Text(cellData.value.toString());
    if (cellData.key == field.model.idField.id) {
      final String id = cellData.value.toString();
      final bool isSelected = selectedIds.contains(id);
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: Gap.regular),
            child: Checkbox(
              value: isSelected,
              onChanged: (_) => toggleRow(<String, dynamic>{
                field.model.idField.id: id,
              }),
            ),
          ),
          Expanded(child: child),
        ],
      );
    } //
    return child;
  }

  Widget buildPreloader() {
    return const KitPreloader();
  }

  @override
  void initState() {
    super.initState();
    unawaited(init());
  }

  @override
  void dispose() {
    searchController.removeListener(finder);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KitModalCard(
      onClose: () => context.navigator.pop(),
      header: Text('${widget.field.name} - editing'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: Gap.large,
                    top: Gap.large,
                    right: Gap.large,
                    bottom: Gap.large,
                  ),
                  // TODO(alphamikle): Add loader
                  child: Material(
                    child: KitTextField(
                      controller: searchController,
                      label: 'Search',
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: Gap.large, right: Gap.large), //
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                child: Material(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    child: isLoading && foundRows.isEmpty
                        ? buildPreloader()
                        : KitTableV2(
                            model: shortChildEntity,
                            dataRows: foundRows,
                            horizontalScrollController: tableScrollController,
                            columnSizes: shortChildEntity.flattenFields.map((Field field) => field.width).toList(),
                            onRowPressed: (Json rowData) => toggleRow(rowData),
                            rowBuilder: rowBuilder,
                            cellBuilder: cellBuilder,
                          ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(Gap.large),
            child: Row(
              children: [
                const Spacer(),
                KitBaseModalBottom(
                  onOk: () => context.navigator.pop(selectedIds.toList()),
                  onCancel: () => context.navigator.pop(null),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
