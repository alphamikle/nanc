import 'package:cms/src/user_space/api/tools.dart';
import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';

abstract class MockApi {
  @protected
  DbService get dbService;

  @protected
  Future<List<Json>> fetchFullList(Model entity) async {
    late List<Json> data;
    if (await dbService.has(entity.id)) {
      final dynamic response = await dbService.get(entity.id);
      if (response is List) {
        final List<Json> tempData = [];
        for (final dynamic row in response) {
          final Json result = <String, dynamic>{};
          if (row is Map) {
            for (final MapEntry<dynamic, dynamic> entry in row.entries) {
              result[entry.key.toString()] = entry.value;
            }
          } else {
            throw Exception('Incorrect type of row: ${row.runtimeType}');
          }
          tempData.add(result);
          await wait();
        }
        data = tempData;
      } else {
        throw Exception('Incorrect type of data: ${response.runtimeType}');
      }
    } else {
      // TODO(alphamikle): REMOVE IT IN THE PROD
      data = await getFileContent(entity.id);
      await saveFullList(entity, data);
    }
    return data;
  }

  @protected
  Future<void> saveFullList(Model entity, List<Json> listData) async {
    await dbService.save(key: entity.id, value: listData);
  }
}
