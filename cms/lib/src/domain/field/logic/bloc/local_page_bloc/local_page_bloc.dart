import 'package:tools/tools.dart';

import '../../../../../../cms.dart';

typedef DataChangesCallback = void Function(Json data);

class LocalPageBloc extends BasePageBloc<BaseEntityPageState> {
  LocalPageBloc({
    required super.draftService,
    this.onDataChanged,
  }) : super(state: BaseEntityPageState.empty());

  final DataChangesCallback? onDataChanged;

  @override
  void updateValue(String fieldId, dynamic fieldValue) {
    super.updateValue(fieldId, fieldValue);
    if (onDataChanged != null) {
      onDataChanged!.call(state.data);
    }
  }

  void initFromJson(Json json) {
    for (final MapEntry<String, dynamic> entry in json.entries) {
      super.updateValue(entry.key, entry.value);
    }
  }
}
