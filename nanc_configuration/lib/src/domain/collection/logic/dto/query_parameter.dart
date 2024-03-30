import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_tools/nanc_tools.dart';

import 'query_parameter_value.dart';

part 'query_parameter.g.dart';

QueryParameterValue _fromJson(dynamic value) {
  return const QueryStringValue('');
}

List<QueryParameterValue> _fromJsonList(dynamic value) {
  return [];
}

@JsonSerializable()
class QuerySingleParameter {
  const QuerySingleParameter({
    required this.name,
    required this.value,
  });

  factory QuerySingleParameter.fromJson(dynamic json) => _$QuerySingleParameterFromJson(castToJson(json));

  Json toJson() => _$QuerySingleParameterToJson(this);

  final String name;

  @JsonKey(fromJson: _fromJson)
  final QueryParameterValue value;
}

@JsonSerializable()
class QueryMultipleParameter {
  const QueryMultipleParameter({
    required this.name,
    required this.values,
  });

  factory QueryMultipleParameter.fromJson(dynamic json) => _$QueryMultipleParameterFromJson(castToJson(json));

  Json toJson() => _$QueryMultipleParameterToJson(this);

  final String name;

  @JsonKey(fromJson: _fromJsonList)
  final List<QueryParameterValue> values;
}
