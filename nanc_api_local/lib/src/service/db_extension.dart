import 'package:flutter/foundation.dart';
import 'package:nanc/model.dart';
import 'package:nanc_tools/nanc_tools.dart';

abstract class LocalApi {
  @protected
  final DbService dbService = createDbService();

  final Map<ModelId, List<Json>> _preloadedData = {};

  void preloadData(Map<ModelId, List<Json>> preloadedData) {
    _preloadedData.clear();
    _preloadedData.addAll(preloadedData);
  }

  @protected
  Future<List<Json>> fetchFullList(Model entity) async {
    late List<Json> data;
    dynamic response;
    if (await dbService.has(entity.id)) {
      response = await dbService.get(entity.id);
    }
    if (response == null || (response is List && response.isEmpty)) {
      response = _preloadedData[entity.id] ?? [];
    }
    if (response is List) {
      final List<Json> tempData = [];
      for (final dynamic row in response) {
        tempData.add(castToJson(row));
        await wait(periodic: true);
      }
      data = tempData;
    } else {
      logInfo('No data or incorrect data type: "${response.runtimeType}" / "$response"');
      return [];
    }
    return data;
  }

  @protected
  Future<void> saveFullList(Model entity, List<Json> listData) async {
    await dbService.save(key: entity.id, value: listData);
  }
}
