import 'package:cms/src/domain/page/logic/bloc/base_entity_page_bloc/base_page_bloc.dart';
import 'package:cms/src/domain/page/logic/bloc/base_entity_page_bloc/base_page_state.dart';
import 'package:cms/src/service/config/config.dart';
import 'package:fields/fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      padding: const EdgeInsets.all(kPadding),
      child: BlocBuilder<BasePageBloc, BaseEntityPageState>(
        builder: (BuildContext context, BaseEntityPageState state) => FieldMapper.fieldToInput(
          field: field,
          creationMode: creationMode,
        ),
      ),
    );
  }
}
