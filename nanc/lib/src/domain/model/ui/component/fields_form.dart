import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:model/model.dart';
import 'package:nanc_fields/nanc_fields.dart';
import 'package:ui_kit/ui_kit.dart';

import '../../../../service/config/config.dart';
import '../../../document/logic/bloc/base_document_bloc/base_document_bloc.dart';
import '../../../document/logic/bloc/base_document_bloc/base_page_state.dart';
import 'fields_form_cell.dart';

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
    return BlocBuilder<BaseDocumentBloc, BaseDocumentState>(
      builder: (BuildContext context, BaseDocumentState state) {
        final List<Widget> children = [];

        for (int i = 0; i < model.fields.length; i++) {
          final List<Field> rowFields = model.fields[i];
          if (rowFields.every((Field field) => field is IdField && field.isStub)) {
            continue;
          }

          children.add(formRowBuilder(context, i));
          if (i != model.fields.length - 1) {
            children.add(const SizedBox(height: kPadding));
          } else if (withBottomPadding) {
            children.add(const SizedBox(height: 300));
          }
        }

        return Form(
          key: formKey,
          child: SuperListView(
            cacheExtent: 500,
            delayPopulatingCacheArea: true,
            children: children,
          ),
        );
      },
    );
  }
}
