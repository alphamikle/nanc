import 'package:model/model.dart';

abstract interface class IModelApi {
  /// ? oldModel will be null, if it is a creation of the new model and not null - if changing
  Future<void> createModelRelatedTable(Model newModel, Model? oldModel);
}
