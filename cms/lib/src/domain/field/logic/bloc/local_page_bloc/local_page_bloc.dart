import 'package:config/config.dart';
import 'package:flutter/material.dart';
import 'package:tools/tools.dart';

import '../../../../page/logic/bloc/base_entity_page_bloc/base_page_bloc.dart';
import '../../../../page/logic/bloc/base_entity_page_bloc/base_page_state.dart';

typedef DataChangesCallback = void Function(Json data);

class LocalPageBloc extends BasePageBloc<BaseEntityPageState> {
  LocalPageBloc({
    required super.draftService,
    this.onDataChanged,
  }) : super(state: BaseEntityPageState.empty());

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
