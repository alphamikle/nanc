import 'package:config/config.dart';
import 'package:model/model.dart';

class FirebaseModelApi implements IModelApi {
  @override
  Future<void> createModelRelatedTable(Model newModel, Model? oldModel) async {}

  @override
  Future<void> deleteModel(Model model) async {}
}
