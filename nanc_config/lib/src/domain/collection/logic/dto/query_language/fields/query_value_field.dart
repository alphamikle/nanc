import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_config/src/domain/collection/logic/dto/query_language/fields/query_field.dart';
import 'package:tools/tools.dart';

part 'query_value_field.g.dart';

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
