import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:tools/tools.dart';

Future<List<Json>> getFileContent(String fileName) async {
  try {
    final String result = await rootBundle.loadString('assets/mock_data/$fileName.json');
    return (jsonDecode(result) as List<dynamic>).cast<Json>();
  } catch (error) {
    return [];
  }
}

Future<void> networkDelay() async {
  const int min = 300;
  const int max = 600;

  final Duration delay = Duration(milliseconds: Random().nextInt(max - min) + min);
  await wait(duration: delay);
}
