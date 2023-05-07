import 'package:json_annotation/json_annotation.dart';

import 'query_field.dart';

part 'query_condition_field.g.dart';

@JsonSerializable()
abstract class QueryConditionField implements QueryField {
  factory QueryConditionField() => throw UnimplementedError();

  static const String fieldsKey = 'fields';
  static const String conditionWrapperKey = 'condition_wrapper';

  List<QueryField> get fields;
}
