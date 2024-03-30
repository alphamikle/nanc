import 'dart:async';
import 'dart:convert';

import 'package:googleapis/firestore/v1.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:nanc/model.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../mapper/firestore_value_mapper.dart';

const String _kProjectId = 'project_id';
const String _kScope = 'https://www.googleapis.com/auth/cloud-platform';

class FirebaseApi {
  FirebaseApi._(this._api, this._projectId, this._databaseId);

  static Future<FirebaseApi> create(String base64JsonKey, {String databaseId = '(default)'}) async {
    assert(base64JsonKey.isNotEmpty, 'Firestore service account json key, encoded in Base64 format - is empty');
    final String encodedJson = String.fromCharCodes(base64Decode(base64JsonKey));
    final DJson jsonServiceKey = jsonDecode(encodedJson) as DJson;
    assert(jsonServiceKey.containsKey(_kProjectId));
    final ServiceAccountCredentials serviceAccountCredentials = ServiceAccountCredentials.fromJson(jsonServiceKey);
    final AutoRefreshingAuthClient client = await clientViaServiceAccount(serviceAccountCredentials, [_kScope]);
    final FirestoreApi firestoreApi = FirestoreApi(client);
    return FirebaseApi._(firestoreApi, jsonServiceKey[_kProjectId] as String, databaseId);
  }

  final FirestoreApi _api;
  final String _projectId;
  final String _databaseId;
  final StreamController<Model> _notificationStreamController = StreamController.broadcast();

  Stream<Model> get changesStream => _notificationStreamController.stream;

  void notifyAboutChanges(Model model) => _notificationStreamController.add(model);

  FirestoreApi get api => _api;

  String _getPath({String? modelId, String? pageId}) {
    final bool isModelIdDefined = modelId != null && modelId.isNotEmpty;
    final bool isPageIdDefined = pageId != null && pageId.isNotEmpty;

    final List<String> path = [
      'projects/$_projectId/databases/$_databaseId/documents',
      if (isModelIdDefined) '/$modelId',
      if (isModelIdDefined && isPageIdDefined) '/$pageId',
    ];
    return path.join();
  }

  Future<RunQueryResponse> runQueryRequest(RunQueryRequest request) async {
    return api.projects.databases.documents.runQuery(request, _getPath());
  }

  Future<Document> getDocument({required String modelId, required String pageId}) async {
    return _api.projects.databases.documents.get(_getPath(modelId: modelId, pageId: pageId));
  }

  Future<void> deleteDocument({required String modelId, required String pageId}) async {
    await _api.projects.databases.documents.delete(_getPath(modelId: modelId, pageId: pageId));
  }

  Future<Document> upsertDocument({required String modelId, required String? pageId, required Json data}) async {
    final Document? existedDocument = pageId == null ? null : await _getDocumentOrNull(modelId: modelId, pageId: pageId);
    final Document request = jsonToDocument(json: data, path: null);
    late final Document result;
    if (existedDocument != null) {
      final String path = _getPath(modelId: modelId, pageId: pageId);
      result = await _api.projects.databases.documents.patch(request, path);
    } else {
      final String path = _getPath();
      result = await _api.projects.databases.documents.createDocument(
        request,
        path,
        modelId,
        documentId: pageId,
      );
    }
    return result;
  }

  Future<Document?> _getDocumentOrNull({required String modelId, required String pageId}) async {
    try {
      final Document document = await getDocument(modelId: modelId, pageId: pageId);
      return document;
    } catch (error) {
      return null;
    }
  }
}
