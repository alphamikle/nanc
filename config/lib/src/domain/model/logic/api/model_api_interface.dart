import '../model/model_interface.dart';

abstract interface class IModelApi {
  /// ? oldModel will be null, if it is a creation of the new model and not null - if changing
  Future<void> createModelRelatedTable(covariant IModel newModel, covariant IModel? oldModel);

  /// ? Hook, which will be called before deleting the model structure from the database
  Future<void> deleteModel(covariant IModel model);
}
