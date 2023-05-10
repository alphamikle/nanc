import 'package:flutter/material.dart';
import 'package:tools/tools.dart';

import '../../../../../../cms.dart';

typedef DataChangesCallback = void Function(Json data);

class LocalPageBloc extends BasePageBloc<BaseEntityPageState> {
  LocalPageBloc({
    required super.draftService,
    this.onDataChanged,
  }) : super(state: BaseEntityPageState.empty());

  DataChangesCallback? onDataChanged;

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
