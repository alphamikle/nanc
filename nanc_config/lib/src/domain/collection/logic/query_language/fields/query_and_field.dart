part of 'query_field.dart';

@autoequal
@CopyWith()
@JsonSerializable(fieldRename: FieldRename.snake)
class QueryAndField extends Equatable implements QueryConditionField {
  const QueryAndField({
    this.fields = const [],
    this.type = QueryFieldType.and,
  });

  factory QueryAndField.fromJson(dynamic json) => _$QueryAndFieldFromJson(castToJson(json));

  @override
  @JsonKey(fromJson: queryFieldsFromJson, toJson: queryFieldsToJson)
  final List<QueryField> fields;

  @override
  final QueryFieldType type;

  @override
  List<Object?> get props => _$props;

  @override
  Json toJson() => _$QueryAndFieldToJson(this);

  @override
  bool get isEmpty => fields.isEmpty || fields.every((QueryField field) => field is QueryConditionField && field.isEmpty);
}
