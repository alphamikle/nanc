import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nanc_icons/nanc_icons.dart';
import 'package:tools/tools.dart';

import '../../../document/logic/bloc/document_bloc/document_bloc.dart';
import '../../../model/logic/bloc/model_list_bloc/model_list_bloc.dart';
import '../../../model/logic/model/logic/model.dart';
import '../../../model/logic/model/logic/model_model.dart';
import '../../../ui_kit/domain/logic/constants/gap.dart';
import '../../../ui_kit/domain/ui/components/kit_buttons/kit_input_button.dart';
import '../../../ui_kit/domain/ui/components/kit_circle_preloader.dart';
import '../../../ui_kit/domain/ui/components/kit_divider.dart';
import '../../../ui_kit/domain/ui/components/kit_inputs/kit_autocomplete_text_field.dart';
import '../../../ui_kit/domain/ui/components/kit_list_tile.dart';
import '../../../ui_kit/domain/ui/components/kit_shimmer_switcher.dart';
import '../../logic/fields/field/field_props.dart';
import '../../logic/fields/models_selector_field/models_selector_field.dart';
import '../../logic/fields/selector_field/title_fields.dart';
import '../field_cell_mixin.dart';
import '../selector_field_cell/selector_field_cell.dart';
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
    safeSetState(() => isPreloading = true);
    controller.text = kLoadingText;
    final dynamic json = pageBloc.valueForKey(fieldId);
    if (json == null) {
      controller.clear();
      safeSetState(() => isPreloading = false);
      return;
    }
    final List<String> titleSegments = titleFields.toTitleSegments(json as DJson);
    final String title = titleSegments.join();
    controller.text = title;
    if (mounted) {
      safeSetState(() => isPreloading = false);
    }
  }

  void showModelStructure() {
    unawaited(
      showDialog(
        context: context,
        builder: (_) => ModelStructureModal(
          modelName: controller.text.isEmpty ? 'Empty' : controller.text,
          structure: (pageBloc.valueForKey(fieldId) as Json?) ?? <String, dynamic>{},
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    unawaited(preload());
    eventBus.onEvent(consumer: eventBusId, eventId: DocumentEvent.documentChanged, handler: saveEventHandler);
  }

  @override
  void dispose() {
    eventBus.unsubscribeFromEvent(consumer: eventBusId, eventId: DocumentEvent.documentChanged);
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
