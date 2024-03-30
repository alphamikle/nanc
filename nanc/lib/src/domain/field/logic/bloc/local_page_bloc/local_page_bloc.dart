import 'package:flutter/material.dart';
import 'package:nanc_configuration/nanc_configuration.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../../../../document/logic/bloc/base_document_bloc/base_document_bloc.dart';
import '../../../../document/logic/bloc/base_document_bloc/base_page_state.dart';

typedef DataChangesCallback = void Function(Json data);

class LocalPageBloc extends BaseDocumentBloc<BaseDocumentState> {
  LocalPageBloc({
    required super.draftService,
    this.onDataChanged,
  }) : super(state: BaseDocumentState.empty());

  DataChangesCallback? onDataChanged;

  void init(QueryField? queryField) {
    final Json data = queryField == null ? {} : mapQueryFieldJsonToQueryFieldCellJson(queryFieldToJson(queryField));
    final Json initialData = queryField == null ? {} : mapQueryFieldJsonToQueryFieldCellJson(queryFieldToJson(queryField));

    emit(state.copyWith(
      data: data,
      initialData: initialData,
    ));
  }

  void clear() {
    emit(state.copyWith(
      data: {},
      initialData: {},
    ));
    for (final TextEditingController controller in state.controllerMap.values) {
      controller.clear();
    }
    updateValue('', null);
    onDataChanged?.call(state.data);
  }

  @override
  void updateValue(String fieldId, dynamic fieldValue) {
    super.updateValue(fieldId, fieldValue);
    onDataChanged?.call(state.data);
  }
}
