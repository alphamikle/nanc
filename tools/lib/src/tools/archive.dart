import 'dart:convert';

import 'package:archive/archive_io.dart' as ar if (dart.library.html) 'package:archive/archive.dart';

String zip(String data) {
  final List<int> result = ar.BZip2Encoder().encode(data.codeUnits);
  return String.fromCharCodes(result);
}

String unzip(String archive) {
  final List<int> data = ar.BZip2Decoder().decodeBytes(archive.codeUnits);
  return String.fromCharCodes(data);
}

String encodeToBase64(String value) => base64Encode(value.codeUnits);

String decodeFromBase64(String value) => String.fromCharCodes(base64Decode(value));
