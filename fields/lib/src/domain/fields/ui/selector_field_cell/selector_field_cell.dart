import 'dart:async';

import 'package:cms/cms.dart';
import 'package:fields/src/domain/fields/logic/selector_field/selector_field.dart';
import 'package:fields/src/domain/fields/ui/field_cell_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

const String kLoadingText = 'Loading...';

class SelectorFieldCell extends FieldCellWidget<SelectorField> {
  const SelectorFieldCell({
    required super.field,
    required super.creationMode,
    super.key,
  });

  @override
  State<SelectorFieldCell> createState() => _SelectorFieldCellState();
}

class _SelectorFieldCellState extends State<SelectorFieldCell> with FieldCellHelper<SelectorField, SelectorFieldCell> {
  List<String> get titleFields => field.titleFields;
  Model get model => field.model;
  SelectorFieldStructure get structure => field.structure;

  late final EventBus eventBus = context.read();
  bool isPreloading = false;
  bool isLoadingFullPageData = false;

  Future<List<Json>> finder(String searchQuery) {
    final PageListProviderInterface entityListProvider = context.read();
    final List<QueryParameterValue> values = searchQuery.split(kDelimiter.replaceAll(' ', '')).map((String it) => QueryStringValue(it.trim())).toList();

    return entityListProvider.fetchPageList(
      model: model,
      subset: [
        model.idField.id,
        ...titleFields,
      ],
      query: QueryDto(
        multipleValues: titleFields.map((e) => QueryMultipleParameter(name: e, values: values)).toList(),
      ),
      params: ParamsDto(
        page: 1,
        limit: 50,
        sort: Sort(field: model.idField.id, order: Order.asc),
      ),
    );
  }

  Future<void> updateValue(Json json) async {
    final String pageId = json[field.model.idField.id].toString();
    final String title = titleFields.map((String it) => json[it].toString()).join(kDelimiter);

    if (structure == SelectorFieldStructure.id) {
      pageBloc.updateValue(fieldId, pageId);
    } else if (structure == SelectorFieldStructure.object) {
      setState(() => isLoadingFullPageData = true);
      unawaited(context.read<PageBloc>().loadPageData(model: model, pageId: pageId).then((Json value) {
        pageBloc.updateValue(fieldId, value);
        setState(() => isLoadingFullPageData = false);

        /// ? We need to set text value here again, because of replacing it after update in the state
        controller.text = title;
      }));
    }
    controller.text = title;
  }

  Widget itemBuilder(BuildContext context, Json data) {
    bool isSelected = false;
    final dynamic value = pageBloc.valueForKey(fieldId);
    if (value != null) {
      if (structure == SelectorFieldStructure.id) {
        isSelected = value == data[field.model.idField.id];
      } else if (structure == SelectorFieldStructure.object) {
        isSelected = isTheSame(data, castToJson(value));
      }
    }

    final String title = titleFields.map((String it) => data[it].toString()).join(kDelimiter);

    return KitListTile(
      title: title,
      isSelected: isSelected,
    );
  }

  Future<void> saveEventHandler(Model entity) async => preload();

  Future<void> preload() async {
    setState(() => isPreloading = true);
    controller.text = kLoadingText;
    if (structure == SelectorFieldStructure.id) {
      final String? modelId = pageBloc.valueForKey(fieldId) as String?;
      if (modelId == null) {
        controller.clear();
        setState(() => isPreloading = false);
        return;
      }
      final Json data = await context.read<PageProviderInterface>().fetchPageData(
        model: model,
        id: modelId,
        subset: [
          modelId,
          ...titleFields,
        ],
      );
      final String title = titleFields.map((String it) => data[it].toString()).join(kDelimiter);
      controller.text = title;
    } else if (structure == SelectorFieldStructure.object) {
      final Json? modelData = pageBloc.valueForKey(fieldId) as Json?;
      if (modelData == null) {
        controller.text = '';
      } else {
        final String title = titleFields.map((String it) => modelData[it].toString()).join(kDelimiter);
        controller.text = title;
      }
    } else {
      throw UnimplementedError('Not found a new structure preloading logic: $structure');
    }
    if (mounted) {
      setState(() => isPreloading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    unawaited(preload());
    eventBus.onEvent(consumer: runtimeType.toString(), eventId: PageEvents.save, handler: saveEventHandler);
  }

  @override
  void dispose() {
    eventBus.unsubscribeFromEvent(consumer: runtimeType.toString(), eventId: PageEvents.save);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KitShimmerSwitcher(
      showShimmer: isPreloading,
      child: KitAutocompleteTextField(
        controller: controller,
        finder: finder,
        placeholder: 'Write something to search...',
        helper: helper,
        onSelect: updateValue,
        itemBuilder: itemBuilder,
        isChanged: pageBloc.fieldWasChanged(fieldId),
        isRequired: field.isRequired,
        suffix: KitCirclePreloader(isLoading: isLoadingFullPageData),
      ),
    );
  }
}
