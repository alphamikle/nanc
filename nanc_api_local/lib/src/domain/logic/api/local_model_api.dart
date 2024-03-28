import 'package:config/config.dart';

class LocalModelApi implements IModelApi {
  @override
  Future<void> createModelRelatedTable(IModel newModel, IModel? oldModel) async {}

  @override
  Future<void> deleteModel(IModel model) async {}
}
