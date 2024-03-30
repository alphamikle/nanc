import 'dart:async';

import 'package:nanc_tools/nanc_tools.dart';

class DraftService {
  DraftService({
    required this.dbService,
  });

  final DbService dbService;
  final Map<String, Timer> _savingTimers = {};

  /// ? To prevent potential collisions
  static String generateKey(List<String?> params) {
    return params.join(':::5c9f6a20-deb4-4996-ac57-4945d43c3a1b:::');
  }

  Future<void> saveDraft({required String key, required Json data}) async {
    _savingTimers[key]?.cancel();
    _savingTimers.remove(key);
    _savingTimers[key] = Timer(const Duration(milliseconds: 500), () async {
      await dbService.save(key: key, value: data);
      _savingTimers.remove(key);
    });
  }

  Future<bool> haveDraft(String key) async => dbService.has(key);

  Future<Json> getDraft(String key) async {
    final Json draft = castToJson(await dbService.get<Object, Object>(key));
    return draft;
  }

  Future<void> deleteDraft(String key) async => dbService.delete(key);
}
