import 'package:model/model.dart';
import 'package:nanc_config/nanc_config.dart';

class MockModelApi implements IModelApi {
  @override
  Future<void> createModelRelatedTable(Model newModel, Model? oldModel) async {
    // DO NOTHING
  }
}
