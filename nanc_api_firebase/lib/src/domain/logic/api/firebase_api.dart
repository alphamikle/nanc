import 'dart:convert';

import 'package:googleapis/firestore/v1.dart';
import 'package:googleapis_auth/auth_io.dart';

class FirebaseApi {
  FirebaseApi._(this._api);

  static Future<FirebaseApi> create(String jsonKey) async {
    final ServiceAccountCredentials serviceAccountCredentials = ServiceAccountCredentials.fromJson(jsonDecode(jsonKey));
    final AutoRefreshingAuthClient client = await clientViaServiceAccount(serviceAccountCredentials, ['https://www.googleapis.com/auth/cloud-platform']);
    final FirestoreApi firestoreApi = FirestoreApi(client);
    return FirebaseApi._(firestoreApi);
  }

  final FirestoreApi _api;
}
