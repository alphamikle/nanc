part of 'query_field.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
sealed class QueryConditionField implements QueryField {
  factory QueryConditionField() => throw UnimplementedError();

  static const String fieldsKey = 'fields';
  static const String conditionWrapperKey = 'condition_wrapper';

  List<QueryField> get fields;

  bool get isEmpty;
  bool get isNotEmpty;
}
