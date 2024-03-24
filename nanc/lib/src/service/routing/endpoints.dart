import 'package:autoequal/autoequal.dart';
import 'package:equatable/equatable.dart';

import 'params_list.dart';
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
  SoloPageEndpoint(),
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
      SoloPageEndpoint(),
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
  String fullPath();
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
  String fullPath() => segment();

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
  String fullPath() => segment();

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
  String fullPath() => segment();

  @override
  String get route => segment();

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
  String fullPath() => segment();

  @override
  String get route => segment();

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
  String fullPath() => segment();

  @override
  String get route => segment();

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
  String fullPath() => segment();

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
  String fullPath() => segment();

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
  String fullPath() => segment();

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
  String fullPath({String? modelId}) => segment(modelId: modelId);

  @override
  String get route => segment();

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
  String fullPath({String? modelId}) => segment(modelId: modelId);

  @override
  String get route => segment();

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
  String fullPath({String? modelId, String? pageId}) => '/collection/${modelId ?? Params.modelId.param}/${pageId ?? Params.pageId.param}';

  @override
  String get route => fullPath();

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
  String fullPath({String? modelId}) => '/collection/${modelId ?? Params.modelId.param}/create';

  @override
  String get route => fullPath();

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
  String fullPath({String? modelId}) => segment(modelId: modelId);

  @override
  String get route => fullPath();

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
  String fullPath() => '/editor/model';

  @override
  String get route => fullPath();

  @override
  List<Object?> get props => _$props;
}

abstract class Endpoints {
  static RootEndpoint get root => RootEndpoint();
  static WelcomeEndpoint get welcome => WelcomeEndpoint();
  static CollectionEndpoint get collection => CollectionEndpoint();
  static CollectionOfModelEndpoint get modelCollection => CollectionOfModelEndpoint();
  static PageOfCollectionEndpoint get collectionPage => PageOfCollectionEndpoint();
  static PageCreationEndpoint get createCollectionPage => PageCreationEndpoint();
  static SoloEndpoint get solo => SoloEndpoint();
  static SoloPageEndpoint get soloPage => SoloPageEndpoint();
  static EditorEndpoint get editor => EditorEndpoint();
  static ModelEditingEndpoint get editModel => ModelEditingEndpoint();
  static ModelCreationEndpoint get createModel => ModelCreationEndpoint();
  static RolesEndpoint get roles => RolesEndpoint();
  static SettingsEndpoint get settings => SettingsEndpoint();
  static IconsEndpoint get icons => IconsEndpoint();
}

extension EndpointRouteToPattern on Endpoint {
  String get pattern {
    final Iterable<RegExpMatch> matches = RegExp(r':(?<param>[^/]+)').allMatches(route);
    String tempRoute = route;
    for (final RegExpMatch match in matches) {
      final String paramName = match.namedGroup('param')!;
      tempRoute = tempRoute.replaceFirst(':$paramName', '(?<$paramName>[^/]+)');
    }
    return tempRoute;
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
  Set<String> get aliases {
    return map((Endpoint endpoint) => endpoint.pattern).toSet();
  }
}
