import 'uri_extension.dart';

abstract class Routes {
  static const String root = '/';
  static const String welcome = '/welcome';

  static String collection() => '/collection';

  static String solo() => '/solo';

  static String editor() => '/editor';

  static String roles() => '/roles';

  static String settings() => '/settings';

  static String icons() => '/icons';

  static String collectionOf(String modelId) => '${collection()}/$modelId';

  static String soloModelGateway(String modelId) => '${solo()}/$modelId/gateway';

  static String pageOfSoloModel(String modelId) => '${solo()}/$modelId';

  static String createPageOfSoloModel(String modelId) => '${solo()}/$modelId/create';

  static String pageOfCollectionModel(String modelId, String pageId) => '${collectionOf(modelId)}/$pageId';

  static String createModelPage(String entityId) => '${editor()}/page/$entityId';

  static String editModel(String entityId) => '${editor()}/model/$entityId';

  static String createModel({QueryParameters? query}) {
    final String path = '${editor()}/model';
    if (query == null || query.isEmpty) {
      return path;
    }
    return Uri(path: path, queryParameters: query).toString();
  }
}
