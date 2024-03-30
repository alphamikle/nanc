import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nanc_icons/nanc_icons.dart';
import 'package:super_sliver_list/super_sliver_list.dart';
import 'package:tools/tools.dart';

import '../../../../service/config/config.dart';
import '../../../../service/routing/endpoints.dart';
import '../../../field/logic/fields/field/field.dart';
import '../../../field/logic/type/field_types.dart';
import '../../../ui_kit/domain/logic/constants/gap.dart';
import '../../../ui_kit/domain/ui/components/kit_buttons/kit_button.dart';
import '../../../ui_kit/domain/ui/components/kit_centered_text.dart';
import '../../../ui_kit/domain/ui/components/kit_column.dart';
import '../../../ui_kit/domain/ui/components/kit_divider.dart';
import '../../../ui_kit/domain/ui/components/kit_inputs/kit_boolean_input.dart';
import '../../../ui_kit/domain/ui/components/kit_inputs/kit_icon_input.dart';
import '../../../ui_kit/domain/ui/components/kit_inputs/kit_id_input.dart';
import '../../../ui_kit/domain/ui/components/kit_inputs/kit_number_field.dart';
import '../../../ui_kit/domain/ui/components/kit_inputs/kit_text_field.dart';
import '../../../ui_kit/domain/ui/components/kit_preloader.dart';
import '../../../ui_kit/domain/ui/components/kit_preloader_v2.dart';
import '../../../ui_kit/domain/ui/components/kit_text.dart';
import '../../../ui_kit/domain/ui/components/kit_tooltip.dart';
import '../../../ui_kit/domain/ui/components/kit_view/kit_view_header.dart';
import '../../../ui_kit/domain/ui/components/kit_view/kit_view_sub_container.dart';
import '../../logic/bloc/model_list_bloc/model_list_bloc.dart';
import '../../logic/bloc/model_page_bloc/model_page_bloc.dart';
import '../../logic/bloc/model_page_bloc/model_page_state.dart';
import '../../logic/model/logic/model.dart';
import '../component/add_field_button.dart';
import '../component/field_card_functional_wrapper.dart';
import '../component/field_creation_modal.dart';
import '../component/field_editor_modal.dart';
import '../component/field_type_selector_modal.dart';

class ModelPageView extends StatefulWidget {
  const ModelPageView({
    required this.creationMode,
    super.key,
  });

  final bool creationMode;

  @override
  State<ModelPageView> createState() => _ModelPageViewState();
}

class _ModelPageViewState extends State<ModelPageView> {
  final GlobalKey<FormState> formKey = GlobalKey();

  Future<void> editField({
    required BuildContext context,
    required Model model,
    required Field field,
    required int row,
    required int column,
  }) async {
    final Field? editedField = await showFieldEditorModal(
      context: context,
      model: model,
      field: field,
    );
    if (context.mounted && editedField != null) {
      context.read<ModelPageBloc>().updateModelField(row: row, column: column, field: editedField);
    }
  }

  Future<void> addField(BuildContext context, int rowIndex) async {
    final FieldType? selectedField = await showFieldTypeSelectorModal(context);
    if (context.mounted && selectedField != null) {
      final Field? createdField = await showFieldCreationModal(context, selectedField);
      if (context.mounted && createdField != null) {
        context.read<ModelPageBloc>().addModelField(createdField, rowIndex);
      }
    }
  }

  Widget buildFieldsRow(BuildContext context, int index) {
    const double customSize = 56;
    final List<List<Field>> allFields = context.read<ModelPageBloc>().state.editableModel.fields;
    final List<Field> rowFields = allFields[index];
    final List<Widget> fieldCards = [];
    final bool isLastRow = index == allFields.length - 1;

    for (int i = 0; i < rowFields.length; i++) {
      final bool isLast = i == rowFields.length - 1;
      final Field field = rowFields[i];

      if (i == 0) {
        fieldCards.add(KitDivider.horizontal(Gap.regular));
      }
      fieldCards.add(
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: Gap.regular),
            child: FieldCardFunctionalWrapper(
              onPressed: () async => editField(context: context, model: field.toModel(), field: field, row: index, column: i),
              availableDirections: [
                if (i > 0) AxisDirection.left,
                if (index > 0) AxisDirection.up,
                if (isLast == false) AxisDirection.right,
                if (isLastRow == false || rowFields.length > 1) AxisDirection.down,
              ],
              creationMode: widget.creationMode,
              field: field,
              onChange: (AxisDirection direction) => context.read<ModelPageBloc>().moveField(row: index, column: i, direction: direction),
              onDelete: () async => context.read<ModelPageBloc>().deleteModelField(index, i),
              onExpand: () => context.read<ModelPageBloc>().expandField(row: index, column: i),
              customSize: customSize,
            ),
          ),
        ),
      );
      fieldCards.add(KitDivider.horizontal(Gap.regular));
      if (isLast) {
        fieldCards.add(
          Padding(
            padding: const EdgeInsets.only(bottom: Gap.regular),
            child: KitTooltip(
              text: 'Add field to the current row',
              child: AddFieldButton(
                onPressed: () async => addField(context, index),
                customHeight: customSize,
              ),
            ),
          ),
        );
      }
    }

    final Widget fieldsRow = Row(
      key: ValueKey(index),
      children: fieldCards,
    );

    if (index == allFields.length - 1) {
      return Column(
        key: const ValueKey('fieldWithButton'),
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          fieldsRow,
          Padding(
            padding: const EdgeInsets.only(left: Gap.regular, bottom: Gap.regular),
            child: SizedBox(
              height: AddFieldButton.size,
              child: KitTooltip(
                text: 'Add field to the new row',
                child: AddFieldButton(
                  onPressed: () async => addField(context, index + 1),
                ),
              ),
            ),
          ),
        ],
      );
    }

    return fieldsRow;
  }

  Future<void> upsert() async {
    if (formKey.currentState?.validate() ?? false) {
      final ModelPageBloc bloc = context.read();
      if (widget.creationMode) {
        await bloc.create();
      } else {
        await bloc.save();
      }
    }
  }

  Future<void> delete() async {
    final GoRouter router = context.router;
    final ModelPageBloc bloc = context.read();
    final bool wasDeleted = await bloc.delete();
    if (wasDeleted) {
      router.goNamed(Endpoints.editor.name);
    }
  }

  String? idFieldValidator(String? id) {
    final ModelPageBloc modelPageBloc = context.read();
    if (id == null || id.isEmpty || modelPageBloc.state.initialModel.id == id) {
      return null;
    }
    final List<Model> allModels = context.read<ModelListBloc>().state.allModels;
    final Map<ModelId, Model> modelsByIds = {};
    final Map<ModelId, int> counts = {};
    for (final Model model in allModels) {
      counts[model.id] = (counts[model.id] ?? 0) + 1;
      modelsByIds[model.id] = model;
    }
    counts[id] = (counts[id] ?? 0) + 1;
    if (counts[id] != null && counts[id]! > 1) {
      return 'This id already taken by ${modelsByIds.containsKey(id) ? '"${modelsByIds[id]!.name}" Model' : 'another Model'}';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final ModelPageBloc bloc = context.read();

    return BlocBuilder<ModelPageBloc, ModelPageState>(
      buildWhen: (ModelPageState previous, ModelPageState current) => previous.modelWasSet != current.modelWasSet,
      builder: (BuildContext context, ModelPageState state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          child: state.modelWasSet
              ? KitViewSubContainer(
                  child: KitColumn(
                    children: [
                      BlocBuilder<ModelPageBloc, ModelPageState>(
                        builder: (BuildContext context, ModelPageState state) {
                          return KitViewHeader(
                            children: [
                              KitText(
                                text: state.hasAnyChanges ? 'Model was changed...' : 'Model was not changed...',
                              ),
                              const Spacer(),
                              if (state.initialModel.codeFirstEntity == false)
                                Padding(
                                  padding: const EdgeInsets.only(right: Gap.regular),
                                  child: KitButton(
                                    onPressed: delete,
                                    color: context.theme.colorScheme.error,
                                    child: AnimatedSwitcher(
                                      duration: const Duration(milliseconds: 250),
                                      child: state.isDeleting
                                          ? SizedBox(width: 35, child: KitPreloader(color: context.theme.colorScheme.error))
                                          : Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(state.initialModel.isHybrid ? IconPack.mdi_restore : IconPack.mdi_delete_empty),
                                                const KitDivider(width: Gap.regular),
                                                KitText(text: state.initialModel.isHybrid ? 'Reset' : 'Delete'),
                                              ],
                                            ),
                                    ),
                                  ),
                                ),
                              KitButton(
                                isLoading: state.isSaving || state.isDeleting,
                                text: 'Save',
                                onPressed: state.hasAnyChanges ? upsert : null,
                                child: AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 250),
                                  child: state.isSaving
                                      ? const SizedBox(width: 35, child: KitPreloader())
                                      : const Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(IconPack.flu_save_filled),
                                            KitDivider(width: Gap.regular),
                                            KitText(text: 'Save'),
                                          ],
                                        ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      BlocBuilder<ModelPageBloc, ModelPageState>(
                        builder: (BuildContext context, ModelPageState state) {
                          return KitPreloaderV2(isLoading: state.isSaving);
                        },
                      ),
                      Expanded(
                        child: BlocBuilder<ModelPageBloc, ModelPageState>(
                          builder: (BuildContext context, ModelPageState state) {
                            return Form(
                              key: formKey,
                              child: CustomScrollView(
                                slivers: [
                                  SliverPadding(
                                    padding: const EdgeInsets.only(
                                      left: kPadding,
                                      top: kPadding,
                                      right: kPadding,
                                    ),
                                    sliver: SuperSliverList(
                                      delegate: SliverChildListDelegate(
                                        /// ? FIELDS OF MODEL ITSELF
                                        [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: KitTextField(
                                                  controller: bloc.findTextEditingControllerForField('name'),
                                                  helper: 'Model name (required)',
                                                  placeholder: 'Type model name...',
                                                  onChanged: (String value) => bloc.updateModelProperty('name', value),
                                                  isRequired: true,
                                                  maxLines: 1,
                                                ),
                                              ),
                                              KitDivider.horizontal(kPadding),
                                              Expanded(
                                                child: KitIdInput(
                                                  controller: bloc.findTextEditingControllerForField(Model.idPropertyName),
                                                  helper: 'Model ID (required)',
                                                  placeholder: 'Type model ID here...',
                                                  tooltip: 'Generate new model id',
                                                  onChanged: (String value) => bloc.updateModelProperty(Model.idPropertyName, value),
                                                  validator: idFieldValidator,
                                                  isRequired: true,
                                                ),
                                              ),
                                              KitDivider.horizontal(kPadding),
                                              Expanded(
                                                child: KitIconInput(
                                                  controller: bloc.findTextEditingControllerForField('icon'),
                                                  helper: 'Model icon',
                                                  onChanged: (String value) => bloc.updateModelProperty('icon', value),
                                                  placeholder: 'Choose an model icon...',
                                                ),
                                              ),
                                            ],
                                          ),
                                          KitDivider.vertical(kPaddingLarge),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: KitBooleanInput(
                                                  helper: 'Is Model a collection?',
                                                  value: bloc.state.editableModel.isCollection,
                                                  onSelect: (bool value) => bloc.updateModelProperty('isCollection', value),
                                                ),
                                              ),
                                              KitDivider.horizontal(kPadding),
                                              Expanded(
                                                child: KitBooleanInput(
                                                  helper: 'Is it needed to show Model at the side menu?',
                                                  value: bloc.state.editableModel.showInMenu,
                                                  onSelect: (bool value) => bloc.updateModelProperty('showInMenu', value),
                                                ),
                                              ),
                                              KitDivider.horizontal(kPadding),
                                              Expanded(
                                                child: KitNumberField(
                                                  helper: 'Model sorting index at the side menu',
                                                  controller: bloc.findTextEditingControllerForField('sort'),
                                                  placeholder: 'Put model sort index here...',
                                                  onChanged: (Object? value) {
                                                    final int integer = value is num ? value.toInt() : 0;
                                                    bloc.updateModelProperty('sort', integer);
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          KitDivider.vertical(kPaddingLarge),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SliverPadding(
                                    padding: const EdgeInsets.only(
                                      top: Gap.large,
                                      right: Gap.regular,
                                    ),
                                    sliver: SuperSliverList(
                                      delegate: SliverChildBuilderDelegate(
                                        buildFieldsRow,
                                        childCount: state.editableModel.fields.length,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                )
              : const KitCenteredText(text: 'Loading...'),
        );
      },
    );
  }
}
