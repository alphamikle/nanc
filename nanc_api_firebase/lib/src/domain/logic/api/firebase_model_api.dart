import 'package:nanc/model.dart';
import 'package:nanc_configuration/nanc_configuration.dart';

class FirebaseModelApi implements IModelApi {
  @override
  Future<void> createModelRelatedTable(Model newModel, Model? oldModel) async {}

  @override
  Future<void> deleteModel(Model model) async {}
}
