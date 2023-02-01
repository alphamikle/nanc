import 'dart:async';

import 'package:cms/cms.dart';
import 'package:fields/src/domain/fields/logic/screen_field/screen_content_model.dart';
import 'package:fields/src/domain/fields/logic/screen_field/screen_field.dart';
import 'package:fields/src/domain/fields/ui/field_cell_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

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
    final dynamic value = pageBloc.valueForKey(fieldId);
    late ScreenContentModel model;
    if (value != null) {
      model = ScreenContentModel.fromJson(value);
    } else {
      model = const ScreenContentModel(content: '', contentType: ScreenContentType.scrollable);
    }
    // TODO(alphamikle): For now ScreenField supports only scrollable type
    context.read<EditorBloc>().initFromModel(model.copyWith(contentType: ScreenContentType.scrollable));
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
                      style: theme.textTheme.subtitle1,
                    ),
                  ],
                ),
              ),
            ),
            Positioned.fill(
              child: KitInkWell(
                onPressed: action,
              ),
            ),
          ],
        );
      },
    );
  }
}
