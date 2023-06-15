import '../../../cms.dart';
import 'uri_extension.dart';

sealed class Endpoint {
  String path();
  String get name;
}

class CollectionEndpoint extends Endpoint {
  @override
  String get name => 'collection';

  @override
  String path() => '/collection';

  CollectionOfModelEndpoint get model => CollectionOfModelEndpoint();
}

class SoloEndpoint extends Endpoint {
  @override
  String get name => 'solo';

  @override
  String path() => '/solo';

  SoloPageGateway get gateway => SoloPageGateway();
  SoloPageEndpoint get page => SoloPageEndpoint();
  SoloPageCreationEndpoint get pageCreation => SoloPageCreationEndpoint();
}

class EditorEndpoint extends Endpoint {
  @override
  String get name => 'editor';

  @override
  String path() => '/editor';

  PageCreationEndpoint get page => PageCreationEndpoint();
  ModelEditingEndpoint get modelEditing => ModelEditingEndpoint();
  ModelCreationEndpoint get modelCreation => ModelCreationEndpoint();
}

class RolesEndpoint extends Endpoint {
  @override
  String get name => 'roles';

  @override
  String path() => '/roles';
}

class SettingsEndpoint extends Endpoint {
  @override
  String get name => 'settings';

  @override
  String path() => '/settings';
}

class IconsEndpoint extends Endpoint {
  @override
  String get name => 'icons';

  @override
  String path() => '/icons';
}

class CollectionOfModelEndpoint extends Endpoint {
  @override
  String get name => 'model-collection';

  /// ? /collection/:modelId
  @override
  String path({String? modelId}) => modelId ?? Params.modelId.param;

  PageOfCollectionEndpoint get page => PageOfCollectionEndpoint();
}

class SoloPageGateway extends Endpoint {
  @override
  String get name => 'solo-gateway';

  /// ? /solo/:modelId/gateway
  @override
  String path({String? modelId}) => '${modelId ?? Params.modelId.param}/gateway';
}

class SoloPageEndpoint extends Endpoint {
  @override
  String get name => 'solo-page';

  /// ? /solo/:modelId
  @override
  String path({String? modelId}) => modelId ?? Params.modelId.param;
}

class SoloPageCreationEndpoint extends Endpoint {
  @override
  String get name => 'create-solo-page';

  /// ? /solo/:modelId/create
  @override
  String path({String? modelId}) => '${modelId ?? Params.modelId.param}/create';
}

class PageOfCollectionEndpoint extends Endpoint {
  @override
  String get name => 'collection-page';

  /// ? /collection/:modelId/:pageId
  @override
  String path({String? modelId, String? pageId}) => pageId ?? Params.pageId.param;
}

class PageCreationEndpoint extends Endpoint {
  @override
  String get name => 'create-page';

  /// ? /editor/page/:modelId
  @override
  String path({String? modelId}) => 'page/${modelId ?? Params.modelId.param}';
}

class ModelEditingEndpoint extends Endpoint {
  @override
  String get name => 'edit-model';

  /// ? /editor/model/:modelId
  @override
  String path({String? modelId}) => 'model/${modelId ?? Params.modelId.param}';
}

class ModelCreationEndpoint extends Endpoint {
  @override
  String get name => 'create-model';

  /// ? /editor/model?solo=<bool>
  @override
  String path({QueryParameters? queryParameters}) {
    if (queryParameters == null || queryParameters.isEmpty) {
      return 'model';
    }
    return Uri(path: 'model', queryParameters: queryParameters).toString();
  }
}
