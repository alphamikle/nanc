part of 'query_field.dart';

@autoequal
@CopyWith()
@JsonSerializable(fieldRename: FieldRename.snake)
class QueryOrField extends Equatable implements QueryConditionField {
  const QueryOrField({
    this.fields = const [],
    this.type = QueryFieldType.or,
  });

  factory QueryOrField.fromJson(dynamic json) => _$QueryOrFieldFromJson(castToJson(json));

  @override
  @JsonKey(fromJson: queryFieldsFromJson, toJson: queryFieldsToJson)
  final List<QueryField> fields;

  @override
  final QueryFieldType type;

  @override
  List<Object?> get props => _$props;

  @override
  Json toJson() => _$QueryOrFieldToJson(this);

  @override
  bool get isEmpty => fields.isEmpty || fields.every((QueryField field) => field is QueryConditionField && field.isEmpty);
}
