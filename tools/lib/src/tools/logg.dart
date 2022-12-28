import 'dart:convert';
import 'dart:developer' as dev;

import 'package:tools/src/types/types.dart';

// ignore: camel_case_types
class logg {
  logg(
    dynamic string, [
    dynamic string2,
    dynamic string3,
    dynamic string4,
    dynamic string5,
    dynamic string6,
    dynamic string7,
    dynamic string8,
    dynamic string9,
    dynamic string10,
  ]) : _name = 'LOG' {
    dev.log(
      <dynamic>[
        string,
        string2,
        string3,
        string4,
        string5,
        string6,
        string7,
        string8,
        string9,
        string10,
      ].where((dynamic value) => value != null).map((dynamic value) => value.toString()).join(' '),
      name: _name,
    );
  }

  logg._silent(this._name);

  factory logg.raw(String name) {
    return logg._silent(name);
  }

  void call(
    dynamic string, [
    dynamic string2,
    dynamic string3,
    dynamic string4,
    dynamic string5,
    dynamic string6,
    dynamic string7,
    dynamic string8,
    dynamic string9,
    dynamic string10,
  ]) {
    dev.log(
      <dynamic>[
        string,
        string2,
        string3,
        string4,
        string5,
        string6,
        string7,
        string8,
        string9,
        string10,
      ].where((dynamic value) => value != null).map((dynamic value) => value.toString()).join(' '),
      name: _name,
    );
  }

  final String _name;
}

String prettyJson(dynamic data, {String indent = ' '}) {
  final JsonEncoder jsonEncoder = JsonEncoder.withIndent(indent);
  if (data is List) {
    final List<dynamic> output = data.map<dynamic>((dynamic e) => _tryToJson(e) ?? e).toList();
    return jsonEncoder.convert(output);
  }
  return jsonEncoder.convert(data);
}

Json? _tryToJson(dynamic value) {
  try {
    return value.toJson() as Json;
  } catch (error) {
    return null;
  }
}
