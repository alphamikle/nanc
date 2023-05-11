import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';

import '../../service/tools/assets_loader.dart';

const bool useAssetsMocks = bool.fromEnvironment('USE_ASSETS_MOCKS');

abstract class MockApi {
  @protected
  DbService get dbService;

  @protected
  Future<List<Json>> fetchFullList(Model entity) async {
    late List<Json> data;
    try {
      if (useAssetsMocks) {
        final String rawMockContent = await rootBundle.loadString(prepareAssetPath('assets/mock_data/${entity.id}.json'));
        final List<dynamic> parsedMockContent = jsonDecode(rawMockContent);
        final List<Json> preparedMockContent = parsedMockContent.map(castToJson).toList();
        await saveFullList(entity, preparedMockContent);
        return preparedMockContent;
      }
    } catch (error) {
      logg('Not found assets for the model: ${entity.id}');
    }
    if (await dbService.has(entity.id)) {
      final dynamic response = await dbService.get(entity.id);
      if (response is List) {
        final List<Json> tempData = [];
        for (final dynamic row in response) {
          tempData.add(castToJson(row));
          await wait(periodic: true, period: 150);
        }
        data = tempData;
      } else {
        throw Exception('Incorrect type of data: ${response.runtimeType}');
      }
    } else {
      data = [];
      await saveFullList(entity, data);
    }
    return data;
  }

  @protected
  Future<void> saveFullList(Model entity, List<Json> listData) async {
    await dbService.save(key: entity.id, value: listData);
  }
}
