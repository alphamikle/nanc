import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../../../../service/config/config.dart';
import '../../../document/logic/bloc/base_document_bloc/base_document_bloc.dart';
import '../../../field/logic/bloc/field_edition_bloc/field_edition_bloc.dart';
import '../../../field/logic/fields/field/field.dart';
import '../../../field/logic/mapper/field_mapper.dart';
import '../../../ui_kit/domain/ui/components/kit_modal/kit_base_modal_bottom.dart';
import '../../../ui_kit/domain/ui/components/kit_modal/kit_modal.dart';
import '../../../ui_kit/domain/ui/components/kit_text.dart';
import '../../logic/model/logic/model.dart';
import 'fields_form.dart';

class FieldEditorModal extends StatefulWidget {
  const FieldEditorModal({
    required this.entity,
    required this.field,
    super.key,
  });

  final Model entity;
  final Field field;

  @override
  State<FieldEditorModal> createState() => _FieldEditorModalState();
}

class _FieldEditorModalState extends State<FieldEditorModal> {
  final GlobalKey<FormState> formKey = GlobalKey();

  void save() {
    final BaseDocumentBloc bloc = context.read();
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      if (bloc is FieldEditionBloc) {
        final Field field = bloc.compileToField();
        logInfo('EDITED FIELD --> ${prettyJson(FieldMapper.fieldToJson(field))}');
        context.navigator.pop(field);
      } else {
        throw Exception('Not found $FieldEditionBloc in the widget tree');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return KitModal(
      header: KitText(text: 'Editing ${capitalize(widget.field.type.name)}'),
      onClose: () => context.navigator.pop(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: kPadding,
                top: kPadding,
                right: kPadding,
                bottom: kPadding,
              ),
              child: FieldsForm(
                formKey: formKey,
                creationMode: false,
                model: widget.entity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(kPaddingLarge),
            child: Row(
              children: [
                const Spacer(),
                KitBaseModalBottom(
                  onOk: save,
                  onCancel: () => context.navigator.pop(null),
                  okText: 'Save',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Future<Field?> showFieldEditorModal({
  required BuildContext context,
  required Model model,
  required Field field,
}) async {
  final Field? result = await showDialog<Field>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) => BlocProvider<BaseDocumentBloc>(
      create: (BuildContext context) => FieldEditionBloc(
        entity: model,
        field: field,
        fieldType: field.type,
        draftService: context.read(),
      ),
      child: FieldEditorModal(
        entity: model,
        field: field,
      ),
    ),
  );
  return result;
}
