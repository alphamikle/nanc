part of 'query_field.dart';

@autoequal
@CopyWith()
@JsonSerializable(fieldRename: FieldRename.snake)
class QueryValueField extends Equatable implements QueryField {
  const QueryValueField({
    this.fieldId = '',
    this.value,
    this.type = QueryFieldType.unknown,
  });

  factory QueryValueField.fromJson(dynamic json) => _$QueryValueFieldFromJson(castToJson(json));

  static const String fieldIdKey = 'field_id';
  static const String valueKey = 'value';
  static const String valueWrapperKey = 'value_wrapper';

  @JsonKey(defaultValue: '')
  final String fieldId;

  /// ? Acceptable values: bool, int, double, String, null
  @JsonKey(defaultValue: '')
  final dynamic value;

  @JsonKey(unknownEnumValue: QueryFieldType.unknown)
  @override
  final QueryFieldType type;

  @override
  List<Object?> get props => _$props;

  @override
  Json toJson() => _$QueryValueFieldToJson(this);
}
