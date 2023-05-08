import 'package:tools/tools.dart';

import '../../../../../../cms.dart';

typedef DataChangesCallback = void Function(Json data);

class LocalPageBloc extends BasePageBloc<BaseEntityPageState> {
  LocalPageBloc({
    required super.draftService,
    this.onDataChanged,
  }) : super(state: BaseEntityPageState.empty());

  DataChangesCallback? onDataChanged;

  void clear() => emit(state.copyWith(data: {}));

  @override
  void updateValue(String fieldId, dynamic fieldValue) {
    super.updateValue(fieldId, fieldValue);
    if (onDataChanged != null) {
      onDataChanged!.call(state.data);
    }
  }
}
