import 'package:cms/src/domain/field/logic/bloc/field_edition_bloc/field_edition_bloc.dart';
import 'package:cms/src/domain/model/ui/component/fields_form.dart';
import 'package:cms/src/domain/page/logic/bloc/base_entity_page_bloc/base_page_bloc.dart';
import 'package:cms/src/service/config/config.dart';
import 'package:fields/fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

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
    final BasePageBloc bloc = context.read();
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
    return KitModalCard(
      header: Text('Creating a new ${capitalize(widget.fieldType.name)}'),
      onClose: () => context.navigator.pop(null),
      child: KitColumn(
        children: [
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
    builder: (BuildContext context) => BlocProvider<BasePageBloc>(
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
