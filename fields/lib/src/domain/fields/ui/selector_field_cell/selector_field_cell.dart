import 'dart:async';

import 'package:cms/cms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

import '../../../../service/tools/complex_title_tools.dart';
import '../../logic/selector_field/selector_field.dart';
import '../../logic/selector_field/title_fields.dart';
import '../field_cell_mixin.dart';

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
  String get eventBusId => [
        runtimeType.toString(),
        model.id,
        model.idField.id,
        ...titleFields.toFieldsIds(),
      ].join();
  String get virtualField => widget.field.virtualField;
  List<TitleField> get titleFields => field.titleFields;
  Model get model => field.model;
  late final EventBus eventBus = context.read();
  bool isPreloading = false;
  bool isLoadingFullPageData = false;

  Future<List<Json>> finder(String searchQuery) {
    final PageListProviderInterface entityListProvider = context.read();
    final List<QueryParameterValue> values = splitComplexTitle(query: searchQuery, titleFields: titleFields)
        .map(
          (String value) => QueryStringValue(value),
        )
        .toList();

    return entityListProvider.fetchPageList(
      model: model,
      subset: [
        model.idField.id,
        ...titleFields.toFieldsIds(),
      ],
      query: QueryDto(
        multipleValues: titleFields.toFieldsIds().map((String it) => QueryMultipleParameter(name: it, values: values)).toList(),
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
    final List<String> titleSegments = titleFields.toTitleSegments(json);
    final String title = titleSegments.join();
    pageBloc.updateValue(fieldId, pageId);
    controller.text = title;
    unawaited(updateVirtualField(pageId));
  }

  Widget itemBuilder(BuildContext context, Json data) {
    bool isSelected = false;
    final dynamic dataId = data[field.model.idField.id];
    final dynamic value = pageBloc.valueForKey(fieldId);
    if (value != null) {
      isSelected = value == dataId;
    }

    final String title = titleFields.toTitleSegments(data).join();

    return KitListTile(
      title: title,
      isSelected: isSelected,
    );
  }

  Future<void> saveEventHandler(Model entity) async => preload();

  Future<void> preload() async {
    setState(() => isPreloading = true);
    controller.text = kLoadingText;
    final String? pageId = pageBloc.valueForKey(fieldId) as String?;
    if (pageId == null) {
      controller.clear();
      setState(() => isPreloading = false);
      return;
    }
    final Json data = await context.read<PageProviderInterface>().fetchPageData(
      model: model,
      id: pageId,
      subset: [
        model.idField.id,
        ...titleFields.toFieldsIds(),
      ],
    );
    final String title = titleFields.toTitleSegments(data).join();
    controller.text = title;
    if (mounted) {
      setState(() => isPreloading = false);
    }
    unawaited(updateVirtualField(pageId));
  }

  Future<void> updateVirtualField(String pageId) async {
    setState(() => isLoadingFullPageData = true);
    final PageBloc pageBloc = context.read();
    final Json data = await pageBloc.loadPageData(model: model, pageId: pageId);
    pageBloc.updateValue(virtualField, data);
    if (mounted) {
      setState(() => isLoadingFullPageData = false);
    }
  }

  @override
  void initState() {
    super.initState();
    unawaited(preload());
    eventBus.onEvent(consumer: eventBusId, eventId: PageEvents.save, handler: saveEventHandler);
  }

  @override
  void dispose() {
    eventBus.unsubscribeFromEvent(consumer: eventBusId, eventId: PageEvents.save);
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
