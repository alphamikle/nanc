import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../document/logic/bloc/base_document_bloc/base_document_bloc.dart';
import '../../../document/logic/bloc/base_document_bloc/base_page_state.dart';
import '../../../field/logic/fields/field/field.dart';
import '../../../field/logic/mapper/field_mapper.dart';
import '../../../ui_kit/domain/ui/constants/gap.dart';

class FieldsFormCell extends StatelessWidget {
  const FieldsFormCell({
    required this.field,
    required this.creationMode,
    super.key,
  });

  final Field field;
  final bool creationMode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Gap.regular,
        top: Gap.regular,
        right: Gap.regular,
      ),
      child: BlocBuilder<BaseDocumentBloc, BaseDocumentState>(
        builder: (BuildContext context, BaseDocumentState state) => FieldMapper.fieldToInput(
          field: field,
          creationMode: creationMode,
        ),
      ),
    );
  }
}
