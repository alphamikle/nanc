import 'package:nanc_configuration/nanc_configuration.dart';
import 'package:nanc/model.dart';

class FirebaseModelApi implements IModelApi {
  @override
  Future<void> createModelRelatedTable(Model newModel, Model? oldModel) async {}

  @override
  Future<void> deleteModel(Model model) async {}
}
