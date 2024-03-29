import 'package:nanc_configuration/nanc_configuration.dart';

class LocalModelApi implements IModelApi {
  @override
  Future<void> createModelRelatedTable(IModel newModel, IModel? oldModel) async {}

  @override
  Future<void> deleteModel(IModel model) async {}
}
