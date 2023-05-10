import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

import '../mapper/query_field_mapper.dart';
import 'query_condition_field.dart';
import 'query_field.dart';

part 'query_or_field.g.dart';

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
}
