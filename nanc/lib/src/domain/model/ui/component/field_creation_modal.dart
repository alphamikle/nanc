import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tools/tools.dart';

import '../../../../service/config/config.dart';
import '../../../document/logic/bloc/base_document_bloc/base_document_bloc.dart';
import '../../../field/logic/bloc/field_edition_bloc/field_edition_bloc.dart';
import '../../../field/logic/fields/field/field.dart';
import '../../../field/logic/mapper/field_mapper.dart';
import '../../../field/logic/type/field_types.dart';
import '../../../ui_kit/domain/ui/components/kit_column.dart';
import '../../../ui_kit/domain/ui/components/kit_modal/kit_base_modal_bottom.dart';
import '../../../ui_kit/domain/ui/components/kit_modal/kit_modal.dart';
import '../../../ui_kit/domain/ui/components/kit_preloader_v2.dart';
import '../../../ui_kit/domain/ui/components/kit_text.dart';
import '../../logic/model/logic/model.dart';
import 'fields_form.dart';

class FieldCreationModal extends StatefulWidget {
  const FieldCreationModal({
    required this.fieldType,
    super.key,
  });

  final FieldType fieldType;

  @override
  State<FieldCreationModal> createState() => _FieldCreationModalState();
}

class _FieldCreationModalState extends State<FieldCreationModal> {
  final GlobalKey<FormState> formKey = GlobalKey();
  late final Model entity = FieldMapper.fieldTypeToEntity(widget.fieldType);

  void save() {
    final BaseDocumentBloc bloc = context.read();
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      if (bloc is FieldEditionBloc) {
        final Field field = bloc.compileToField();
        context.navigator.pop(field);
      } else {
        throw Exception('Not found $FieldEditionBloc in the widget tree');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return KitModal(
      header: KitText(text: 'Creating a new ${capitalize(widget.fieldType.name)}'),
      onClose: () => context.navigator.pop(null),
      child: KitColumn(
        children: [
          const KitPreloaderV2(isLoading: false),
          Expanded(
            child: FieldsForm(
              creationMode: true,
              formKey: formKey,
              model: entity,
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

Future<Field?> showFieldCreationModal(BuildContext context, FieldType fieldType) async {
  final Field? result = await showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) => BlocProvider<BaseDocumentBloc>(
      create: (BuildContext context) => FieldEditionBloc(
        entity: FieldMapper.fieldTypeToEntity(fieldType),
        fieldType: fieldType,
        field: null,
        draftService: context.read(),
      ),
      child: FieldCreationModal(fieldType: fieldType),
    ),
  );
  return result;
}
