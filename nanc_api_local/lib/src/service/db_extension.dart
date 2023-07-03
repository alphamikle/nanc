import 'package:flutter/foundation.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';

abstract class LocalApi {
  @protected
  final DbService dbService = createDbService();

  @protected
  Future<List<Json>> fetchFullList(Model entity) async {
    late List<Json> data;
    dynamic response;
    if (await dbService.has(entity.id)) {
      response = await dbService.get(entity.id);
    }
    if (response is List) {
      final List<Json> tempData = [];
      for (final dynamic row in response) {
        tempData.add(castToJson(row));
        await wait(periodic: true);
      }
      data = tempData;
    } else {
      logg('No data or incorrect data type: "${response.runtimeType}" / "$response"');
      return [];
    }
    return data;
  }

  @protected
  Future<void> saveFullList(Model entity, List<Json> listData) async {
    await dbService.save(key: entity.id, value: listData);
  }
}
