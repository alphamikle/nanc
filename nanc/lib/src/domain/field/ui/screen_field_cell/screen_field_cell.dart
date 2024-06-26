import 'dart:async';
import 'dart:convert';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../../../editor/logic/bloc/editor/editor_bloc.dart';
import '../../../editor/ui/view/screen_editor_view.dart';
import '../../../ui_kit/domain/logic/constants/gap.dart';
import '../../../ui_kit/domain/ui/components/kit_container_transition.dart';
import '../../../ui_kit/domain/ui/components/kit_ink_well.dart';
import '../../../ui_kit/domain/ui/components/kit_inputs/kit_segmented_field/kit_segmented_field_ui.dart';
import '../../../ui_kit/domain/ui/theme/kit_borders.dart';
import '../../logic/fields/screen_field/screen_content_model.dart';
import '../../logic/fields/screen_field/screen_field.dart';
import '../field_cell_mixin.dart';

class ScreenFieldCell extends FieldCellWidget<ScreenField> {
  const ScreenFieldCell({
    required super.field,
    required super.creationMode,
    super.key,
  });

  @override
  State<ScreenFieldCell> createState() => _ScreenFieldCellState();
}

class _ScreenFieldCellState extends State<ScreenFieldCell> with FieldCellHelper<ScreenField, ScreenFieldCell> {
  Future<void> preload() async {
    dynamic value = pageBloc.valueForKey(fieldId);
    if (value is String) {
      value = jsonDecode(value);
    }
    late ScreenContentModel model;
    if (value != null) {
      model = ScreenContentModel.fromJson(value);
    } else {
      model = const ScreenContentModel(content: '', contentType: ScreenContentType.scrollable);
    }
    await context.read<EditorBloc>().initFromModel(model);
  }

  Widget editorPageBuilder(BuildContext context, CloseContainerActionCallback<String> action) {
    return ScreenEditor(
      field: field,
      creationMode: creationMode,
    );
  }

  @override
  void initState() {
    super.initState();
    unawaited(preload());
  }

  @override
  Widget build(BuildContext context) {
    final Color borderColor = KitSegmentedFieldUI.generateBorderColor(
      context: context,
      isChanged: false,
      hasError: false,
      hasFocus: false,
    );
    final ThemeData theme = context.theme;

    return KitContainerTransition(
      openBuilder: editorPageBuilder,
      useRootNavigator: true,
      transitionDuration: const Duration(milliseconds: 500),
      closedBuilder: (BuildContext context, VoidCallback action) {
        return Stack(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: theme.inputDecorationTheme.fillColor,
                borderRadius: context.kitBorders.inputRadius,
                border: Border.all(
                  color: borderColor,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: Gap.regular,
                  top: Gap.large,
                  right: Gap.regular,
                  bottom: Gap.large,
                ),
                child: Row(
                  children: [
                    Text(
                      helper,
                      style: theme.textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
            ),
            Positioned.fill(child: KitInkWell(onPressed: action)),
          ],
        );
      },
    );
  }
}
