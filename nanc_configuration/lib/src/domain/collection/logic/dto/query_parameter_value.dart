import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_tools/nanc_tools.dart';

part 'query_parameter_value.g.dart';

abstract class QueryParameterValue {
  const QueryParameterValue();

  Json toJson();

  abstract final Object value;
}

@JsonSerializable()
class QueryStringValue extends QueryParameterValue {
  const QueryStringValue(this.value);

  factory QueryStringValue.fromJson(dynamic json) => _$QueryStringValueFromJson(castToJson(json));

  @override
  Json toJson() => _$QueryStringValueToJson(this);

  @override
  final String value;
}

@JsonSerializable()
class QueryNumberValue extends QueryParameterValue {
  const QueryNumberValue(this.value);

  factory QueryNumberValue.fromJson(dynamic json) => _$QueryNumberValueFromJson(castToJson(json));

  @override
  Json toJson() => _$QueryNumberValueToJson(this);

  @override
  final num value;
}

@JsonSerializable()
class QueryBooleanValue extends QueryParameterValue {
  // ignore: avoid_positional_boolean_parameters
  const QueryBooleanValue(this.value);

  factory QueryBooleanValue.fromJson(dynamic json) => _$QueryBooleanValueFromJson(castToJson(json));

  @override
  Json toJson() => _$QueryBooleanValueToJson(this);

  @override
  final bool value;
}
