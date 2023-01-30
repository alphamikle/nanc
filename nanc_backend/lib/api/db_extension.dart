import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:model/model.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart' as pp;
import 'package:tools/tools.dart';

const bool kStreamDataIntoTheFiles = true;
const String kStreamingDir = String.fromEnvironment('STREAMING_DIR');

abstract class MockApi {
  @protected
  DbService get dbService;

  @protected
  Future<List<Json>> fetchFullList(Model entity) async {
    late List<Json> data;
    dynamic response;
    final String assetFileName = '${entity.id}.json';
    if (await dbService.has(entity.id)) {
      response = await dbService.get(entity.id);
    } else {
      try {
        final String content = await rootBundle.loadString('assets/$assetFileName');
        if (content.isNotEmpty) {
          response = jsonDecode(content);
        }
      } catch (error) {
        logg('1. Error on parsing asset with data: $error');
        try {
          final String content = await rootBundle.loadString(assetFileName);
          if (content.isNotEmpty) {
            response = jsonDecode(content);
          }
        } catch (error) {
          logg('2. Error on parsing asset with data: $error');
        }
      }
    }
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
        await wait(periodic: true);
      }
      data = tempData;
    } else {
      logg('No data or incorrect data type: "${response.runtimeType}" / "$response"');
      return [];
    }
    if (kStreamDataIntoTheFiles && kIsWeb == false && Platform.isMacOS) {
      final Directory outputDir = kStreamingDir.isEmpty ? await pp.getApplicationDocumentsDirectory() : Directory(kStreamingDir);
      logg('Files stream directory will be: file://${outputDir.path}');
      final String filePath = p.join(outputDir.path, assetFileName);
      final File outputFile = File(filePath);
      await outputFile.writeAsString(prettyJson(data));
      logg('Output data was written into the file://$filePath');
    }
    return data;
  }

  @protected
  Future<void> saveFullList(Model entity, List<Json> listData) async {
    await dbService.save(key: entity.id, value: listData);
  }
}
