import 'dart:convert';

import 'package:logger/logger.dart';

import '../types/types.dart';

final Logger _logger = Logger(printer: PrettyPrinter());

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

void logInfo(Object? message, {Object? error, StackTrace? stackTrace}) {
  _logger.i(message, error, stackTrace);
}

void logWarning(Object? message, {Object? error, StackTrace? stackTrace}) {
  _logger.w(message, error, stackTrace);
}

void logError(Object? message, {Object? error, StackTrace? stackTrace}) {
  _logger.e(message, error, stackTrace);
}
