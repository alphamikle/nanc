import 'package:firebase_storage/firebase_storage.dart';

class FirebaseApi {
  FirebaseApi._(this._storage);

  static Future<FirebaseApi> create({
    required FirebaseStorage storage,
  }) async {
    return FirebaseApi._(storage);
  }

  final FirebaseStorage _storage;

  FirebaseStorage get storage => _storage;
}
