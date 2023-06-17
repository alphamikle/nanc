import 'package:autoequal/autoequal.dart';
import 'package:equatable/equatable.dart';

import '../../../cms.dart';
import 'uri_extension.dart';

part 'endpoints.g.dart';

final List<Endpoint> _endpoints = [
  RootEndpoint(),
  WelcomeEndpoint(),
  CollectionEndpoint(),
  SoloEndpoint(),
  EditorEndpoint(),
  RolesEndpoint(),
  SettingsEndpoint(),
  IconsEndpoint(),
  CollectionOfModelEndpoint(),
  SoloPageGateway(),
  SoloPageEndpoint(),
  SoloPageCreationEndpoint(),
  PageCreationEndpoint(),
  PageOfCollectionEndpoint(),
  ModelEditingEndpoint(),
  ModelCreationEndpoint(),
];

Set<Endpoint> get _collectionEndpoints => {
      CollectionEndpoint(),
      CollectionOfModelEndpoint(),
      PageCreationEndpoint(),
      PageOfCollectionEndpoint(),
    };

Set<Endpoint> get _soloEndpoints => {
      SoloEndpoint(),
      SoloPageGateway(),
      SoloPageEndpoint(),
      SoloPageCreationEndpoint(),
    };

Set<Endpoint> get _editorEndpoints => {
      EditorEndpoint(),
      ModelEditingEndpoint(),
      ModelCreationEndpoint(),
    };

sealed class Endpoint extends Equatable {
  const Endpoint();

  factory Endpoint.fromPath(String path) {
    final Uri uri = Uri.parse(path);
    for (final Endpoint endpoint in _endpoints) {
      final RegExp endpointRegExp = RegExp('^${endpoint.pattern}\$');
      if (endpointRegExp.hasMatch(uri.path)) {
        return endpoint;
      }
    }
    throw ArgumentError('Not found any Endpoint for the path "$path"');
  }

  static Endpoint? tryFromPath(String path) {
    try {
      return Endpoint.fromPath(path);
    } catch (error) {
      // Handle error
    }
    return null;
  }

  static bool isCollectionEndpoint(String path) => Endpoint.tryFromPath(path)?.isCollectionEndpoint ?? false;

  static bool isSoloEndpoint(String path) => Endpoint.tryFromPath(path)?.isSoloEndpoint ?? false;

  static bool isEditorEndpoint(String path) => Endpoint.tryFromPath(path)?.isEditorEndpoint ?? false;

  static Set<Endpoint> get collectionEndpoints => _collectionEndpoints;
  static Set<Endpoint> get soloEndpoints => _soloEndpoints;
  static Set<Endpoint> get editorEndpoints => _editorEndpoints;

  String segment();
  String get route;
  String get name;
}

@autoequal
class RootEndpoint extends Endpoint {
  @override
  final String name = 'root';

  @override
  String segment() => '/';

  @override
  String get route => segment();

  @override
  List<Object?> get props => _$props;
}

@autoequal
class WelcomeEndpoint extends Endpoint {
  @override
  final String name = 'welcome';

  @override
  String segment() => '/welcome';

  @override
  String get route => segment();

  @override
  List<Object?> get props => _$props;
}

@autoequal
class CollectionEndpoint extends Endpoint {
  @override
  final String name = 'collection';

  @override
  String segment() => '/collection';

  @override
  String get route => segment();

  CollectionOfModelEndpoint get model => CollectionOfModelEndpoint();

  @override
  List<Object?> get props => _$props;
}

@autoequal
class SoloEndpoint extends Endpoint {
  @override
  final String name = 'solo';

  @override
  String segment() => '/solo';

  @override
  String get route => segment();

  SoloPageGateway get gateway => SoloPageGateway();
  SoloPageEndpoint get page => SoloPageEndpoint();
  SoloPageCreationEndpoint get pageCreation => SoloPageCreationEndpoint();

  @override
  List<Object?> get props => _$props;
}

@autoequal
class EditorEndpoint extends Endpoint {
  @override
  final String name = 'editor';

  @override
  String segment() => '/editor';

  @override
  String get route => segment();

  ModelEditingEndpoint get modelEditing => ModelEditingEndpoint();
  ModelCreationEndpoint get modelCreation => ModelCreationEndpoint();

  @override
  List<Object?> get props => _$props;
}

@autoequal
class RolesEndpoint extends Endpoint {
  @override
  final String name = 'roles';

  @override
  String segment() => '/roles';

  @override
  String get route => segment();

  @override
  List<Object?> get props => _$props;
}

@autoequal
class SettingsEndpoint extends Endpoint {
  @override
  final String name = 'settings';

  @override
  String segment() => '/settings';

  @override
  String get route => segment();

  @override
  List<Object?> get props => _$props;
}

@autoequal
class IconsEndpoint extends Endpoint {
  @override
  final String name = 'icons';

  @override
  String segment() => '/icons';

  @override
  String get route => segment();

  @override
  List<Object?> get props => _$props;
}

@autoequal
class CollectionOfModelEndpoint extends Endpoint {
  @override
  final String name = 'model-collection';

  /// ? /collection/:modelId
  @override
  String segment({String? modelId}) => '/collection/${modelId ?? Params.modelId.param}';

  @override
  String get route => '/collection/${Params.modelId.param}';

  PageOfCollectionEndpoint get page => PageOfCollectionEndpoint();
  PageCreationEndpoint get pageCreation => PageCreationEndpoint();

  @override
  List<Object?> get props => _$props;
}

@autoequal
class SoloPageGateway extends Endpoint {
  @override
  final String name = 'solo-gateway';

  /// ? /solo/:modelId/gateway
  @override
  String segment({String? modelId}) => '/solo/${modelId ?? Params.modelId.param}/gateway';

  @override
  String get route => '/solo/${Params.modelId.param}/gateway';

  @override
  List<Object?> get props => _$props;
}

@autoequal
class SoloPageEndpoint extends Endpoint {
  @override
  final String name = 'solo-page';

  /// ? /solo/:modelId
  @override
  String segment({String? modelId}) => '/solo/${modelId ?? Params.modelId.param}';

  @override
  String get route => '/solo/${Params.modelId.param}';

  @override
  List<Object?> get props => _$props;
}

@autoequal
class SoloPageCreationEndpoint extends Endpoint {
  @override
  final String name = 'create-solo-page';

  /// ? /solo/:modelId/create
  @override
  String segment({String? modelId}) => '/solo/${modelId ?? Params.modelId.param}/create';

  @override
  String get route => '/solo/${Params.modelId.param}/create';

  @override
  List<Object?> get props => _$props;
}

@autoequal
class PageOfCollectionEndpoint extends Endpoint {
  @override
  final String name = 'collection-page';

  /// ? /collection/:modelId/:pageId
  @override
  String segment({String? modelId, String? pageId}) => pageId ?? Params.pageId.param;

  @override
  String get route => '/collection/${Params.modelId.param}/${Params.pageId.param}';

  @override
  List<Object?> get props => _$props;
}

@autoequal
class PageCreationEndpoint extends Endpoint {
  @override
  final String name = 'create-page';

  /// ? /collection/:modelId/create
  @override
  String segment() => 'create';

  @override
  String get route => '/collection/${Params.modelId.param}/create';

  @override
  List<Object?> get props => _$props;
}

@autoequal
class ModelEditingEndpoint extends Endpoint {
  @override
  final String name = 'edit-model';

  /// ? /editor/model/:modelId
  @override
  String segment({String? modelId}) => '/editor/model/${modelId ?? Params.modelId.param}';

  @override
  String get route => '/editor/model/${Params.modelId.param}';

  @override
  List<Object?> get props => _$props;
}

@autoequal
class ModelCreationEndpoint extends Endpoint {
  @override
  final String name = 'create-model';

  /// ? /editor/model?solo=<bool>
  @override
  String segment({QueryParameters? queryParameters}) {
    if (queryParameters == null || queryParameters.isEmpty) {
      return '/editor/model';
    }
    return Uri(path: '/editor/model', queryParameters: queryParameters).toString();
  }

  @override
  String get route => '/editor/model';

  @override
  List<Object?> get props => _$props;
}

abstract class Endpoints {
  static RootEndpoint get root => RootEndpoint();
  static WelcomeEndpoint get welcome => WelcomeEndpoint();
  static CollectionEndpoint get collection => CollectionEndpoint();
  static SoloEndpoint get solo => SoloEndpoint();
  static EditorEndpoint get editor => EditorEndpoint();
  static RolesEndpoint get roles => RolesEndpoint();
  static SettingsEndpoint get settings => SettingsEndpoint();
  static IconsEndpoint get icons => IconsEndpoint();
}

extension EndpointRouteToPattern on Endpoint {
  String get pattern {
    return route.replaceAll(RegExp(r'(?<param>:[^/]+)'), r'[^/]+');
  }

  bool get isCollectionEndpoint {
    return _collectionEndpoints.contains(this);
  }

  bool get isSoloEndpoint {
    return _soloEndpoints.contains(this);
  }

  bool get isEditorEndpoint {
    return _editorEndpoints.contains(this);
  }
}

extension EndpointsAliases on Set<Endpoint> {
  List<String> get aliases {
    return map((Endpoint endpoint) => endpoint.pattern).toList();
  }
}
