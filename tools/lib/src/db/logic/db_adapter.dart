import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

@immutable
class DbAdapter<T> {
  const DbAdapter({
    required this.adapter,
    this.internal = false,
    this.override = false,
  });

  final TypeAdapter<T> adapter;
  final bool internal;
  final bool override;
}
