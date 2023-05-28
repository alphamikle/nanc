import 'dart:convert';

import 'package:googleapis/firestore/v1.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:tools/tools.dart';

const String _kProjectId = 'project_id';
const String _kScope = 'https://www.googleapis.com/auth/cloud-platform';

class FirebaseApi {
  FirebaseApi._(this._api, this._projectId);

  static Future<FirebaseApi> create(String base64JsonKey) async {
    assert(base64JsonKey.isNotEmpty, 'Firestore service account json key, encoded in Base64 format - is empty');
    final String encodedJson = String.fromCharCodes(base64Decode(base64JsonKey));
    final DJson jsonServiceKey = jsonDecode(encodedJson);
    assert(jsonServiceKey.containsKey(_kProjectId));
    final ServiceAccountCredentials serviceAccountCredentials = ServiceAccountCredentials.fromJson(jsonServiceKey);
    final AutoRefreshingAuthClient client = await clientViaServiceAccount(serviceAccountCredentials, [_kScope]);
    final FirestoreApi firestoreApi = FirestoreApi(client);
    return FirebaseApi._(firestoreApi, jsonServiceKey[_kProjectId] as String);
  }

  final FirestoreApi _api;
  final String _projectId;

  FirestoreApi get api => _api;

  Future<RunQueryResponse> runQueryRequest(RunQueryRequest request) async {
    return api.projects.databases.documents.runQuery(request, 'projects/$_projectId/databases/(default)/documents');
  }
}
