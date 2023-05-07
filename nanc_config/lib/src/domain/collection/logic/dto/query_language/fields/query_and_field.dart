import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_config/src/domain/collection/logic/dto/query_language/fields/query_condition_field.dart';
import 'package:nanc_config/src/domain/collection/logic/dto/query_language/fields/query_field.dart';
import 'package:nanc_config/src/domain/collection/logic/dto/query_language/mapper/query_field_mapper.dart';
import 'package:tools/tools.dart';

part 'query_and_field.g.dart';

@autoequal
@CopyWith()
@JsonSerializable()
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

  Json toJson() => _$QueryAndFieldToJson(this);
}
