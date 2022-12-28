import 'package:cms/src/domain/model/ui/component/fields_form_cell.dart';
import 'package:cms/src/domain/page/logic/bloc/base_entity_page_bloc/base_page_bloc.dart';
import 'package:cms/src/domain/page/logic/bloc/base_entity_page_bloc/base_page_state.dart';
import 'package:cms/src/service/config/config.dart';
import 'package:fields/fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:model/model.dart';

class FieldsForm extends StatelessWidget {
  const FieldsForm({
    required this.model,
    required this.formKey,
    required this.creationMode,
    this.withBottomPadding = false,
    super.key,
  });

  final Model model;
  final GlobalKey<FormState> formKey;
  final bool creationMode;
  final bool withBottomPadding;

  Widget formRowBuilder(BuildContext context, int index) {
    final List<Field> rowFields = model.fields[index];
    final List<Widget> children = [];

    for (int i = 0; i < rowFields.length; i++) {
      children.add(
        Expanded(
          child: FieldsFormCell(
            creationMode: creationMode,
            field: rowFields[i],
          ),
        ),
      );
      if (i != rowFields.length - 1) {
        children.add(const SizedBox(width: 8));
      }
    }

    if (children.isEmpty) {
      return const SizedBox.shrink();
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasePageBloc, BaseEntityPageState>(
      builder: (BuildContext context, BaseEntityPageState state) {
        final List<Widget> children = [];

        for (int i = 0; i < model.fields.length; i++) {
          children.add(formRowBuilder(context, i));
          if (i != model.fields.length - 1) {
            children.add(const SizedBox(height: kPadding));
          } else if (withBottomPadding) {
            children.add(const SizedBox(height: 300));
          }
        }

        return Form(
          key: formKey,
          child: ListView(
            children: children,
          ),
        );
      },
    );
  }
}
