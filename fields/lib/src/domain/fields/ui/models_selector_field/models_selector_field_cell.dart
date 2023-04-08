import 'dart:async';

import 'package:cms/cms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons/icons.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

import '../../../../../fields.dart';
import 'model_structure_modal.dart';

class ModelsSelectorFieldCell extends FieldCellWidget<ModelsSelectorField> {
  const ModelsSelectorFieldCell({
    required super.field,
    required super.creationMode,
    super.key,
  });

  @override
  State<ModelsSelectorFieldCell> createState() => _ModelsSelectorFieldCellState();
}

class _ModelsSelectorFieldCellState extends State<ModelsSelectorFieldCell> with FieldCellHelper<ModelsSelectorField, ModelsSelectorFieldCell> {
  String get eventBusId => [
        runtimeType.toString(),
        model.id,
        model.idField.id,
      ].join();
  List<TitleField> get titleFields => const [
        ExternalField.id(fieldNameProperty),
      ];
  Model get model => modelModel;
  late final EventBus eventBus = context.read();
  bool isPreloading = false;
  bool isLoadingFullPageData = false;

  Future<List<Json>> finder(String searchQuery) async {
    final ModelListBloc modelListBloc = context.read();
    final List<Model> models = modelListBloc.state.allModels;
    return models.map((Model model) => model.toJson()).toList();
  }

  Future<void> updateValue(Json json) async {
    final List<String> titleSegments = titleFields.toTitleSegments(json);
    final String title = titleSegments.join();
    pageBloc.updateValue(fieldId, json);
    controller.text = title;
  }

  Widget itemBuilder(BuildContext context, Json data) {
    bool isSelected = false;
    final dynamic value = pageBloc.valueForKey(fieldId);
    if (value != null) {
      isSelected = value[fieldIdProperty] == data[fieldIdProperty];
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
    final dynamic json = pageBloc.valueForKey(fieldId);
    if (json == null) {
      controller.clear();
      setState(() => isPreloading = false);
      return;
    }
    final List<String> titleSegments = titleFields.toTitleSegments(json);
    final String title = titleSegments.join();
    controller.text = title;
    if (mounted) {
      setState(() => isPreloading = false);
    }
  }

  void showModelStructure() {
    unawaited(
      showDialog(
        context: context,
        builder: (_) => ModelStructureModal(
          modelName: controller.text.isEmpty ? 'Empty' : controller.text,
          structure: pageBloc.valueForKey(fieldId) ?? <String, dynamic>{},
        ),
      ),
    );
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: KitShimmerSwitcher(
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
          ),
        ),
        const KitDivider(width: Gap.regular),
        KitInputButton(
          icon: IconPack.mdi_code_json,
          tooltip: 'Show model structure',
          embed: false,
          onPressed: showModelStructure,
        ),
      ],
    );
  }
}
