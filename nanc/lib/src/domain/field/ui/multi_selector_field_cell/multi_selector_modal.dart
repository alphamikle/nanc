import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nanc_configuration/nanc_configuration.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../../../../service/errors/human_exception.dart';
import '../../../../service/errors/ui_error.dart';
import '../../../model/logic/model/logic/model.dart';
import '../../../ui_kit/domain/logic/constants/gap.dart';
import '../../../ui_kit/domain/ui/components/kit_centered_text.dart';
import '../../../ui_kit/domain/ui/components/kit_inputs/kit_text_field.dart';
import '../../../ui_kit/domain/ui/components/kit_modal/kit_base_modal_bottom.dart';
import '../../../ui_kit/domain/ui/components/kit_modal/kit_modal.dart';
import '../../../ui_kit/domain/ui/components/kit_preloader_v2.dart';
import '../../../ui_kit/domain/ui/components/kit_table_v2/kit_table_v2.dart';
import '../../logic/fields/field/field.dart';
import '../../logic/fields/multi_selector_field/multi_selector_field.dart';
import '../../logic/fields/selector_field/title_fields.dart';
import '../../logic/tools/complex_title_tools.dart';

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
  String get tableId => '${field.id}:multi_selector_modal';

  MultiSelectorField get field => widget.field;
  final TextEditingController searchController = TextEditingController();
  late final Map<int, double>? initialSizes = read<SettingsBloc>().widthForModel(tableId);
  final Set<String> selectedIds = {};
  final List<Json> foundRows = [];
  bool isLoading = false;
  bool isError = false;

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
    safeSetState(() {
      isLoading = true;
      isError = false;
    });
    Debouncer.run(id: '${field.id}:finder', () async {
      try {
        if (mounted) {
          final ICollectionProvider provider = context.read();
          final List<String> values = splitComplexTitle(query: searchController.text, titleFields: field.titleFields);
          final List<QueryValueField> queryValues = [];
          final List<String> titleFieldsIds = field.titleFields.toFieldsIds();

          for (final String titleFieldId in titleFieldsIds) {
            for (final String value in values) {
              queryValues.add(
                QueryValueField(
                  fieldId: titleFieldId,
                  value: value,
                  type: QueryFieldType.contains,
                ),
              );
            }
          }

          final CollectionResponseDto result = await provider.fetchPageList(
            model: field.model,
            subset: [
              field.model.idField.id,
              ...field.titleFields.toFieldsIds(),
            ],
            query: QueryOrField(fields: queryValues),
            params: ParamsDto(
              page: 1,
              limit: 50,
              sort: Sort(fieldId: field.model.idField.id, order: Order.asc),
            ),
          );
          foundRows.clear();
          foundRows.addAll(result.data);
          safeSetState(() => isLoading = false);
        }
      } catch (error) {
        safeSetState(() {
          isLoading = false;
          isError = true;
        });
        throw error.toHumanException('Filtered data loading error');
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
    return KitModal(
      onClose: () => context.navigator.pop(),
      header: Text('${widget.field.name} - editing'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: Gap.large,
              top: Gap.large,
              right: Gap.large,
              bottom: Gap.large,
            ),
            child: Material(
              child: KitTextField(
                controller: searchController,
                label: 'Search',
              ),
            ),
          ),
          KitPreloaderV2(isLoading: isLoading),
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: isError
                  ? const UiError()
                  : Material(
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 250),
                        child: isLoading && foundRows.isEmpty
                            ? const KitCenteredText(text: 'Loading')
                            : KitTableV2(
                                model: shortChildEntity,
                                dataRows: foundRows,
                                totalPages: 0,
                                currentPage: 0,
                                paginationEnabled: false,
                                onRowPressed: (Json rowData) => toggleRow(rowData),
                                rowBuilder: rowBuilder,
                                cellBuilder: cellBuilder,
                                onResize: (Map<int, double> widths) => read<SettingsBloc>().saveWidth(modelId: tableId, widths: widths),
                                initialSizes: initialSizes,
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
