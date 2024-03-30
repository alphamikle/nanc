import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_tools/nanc_tools.dart';

import 'query_parameter.dart';

part 'query_dto.g.dart';

/// An object, which contains a set of the model fields,
/// which will be used for querying a list of model data
/// For example:
/// query: { title: "The yea" } - we want to find something by only one entry
/// or
/// query: { title: ["The year of adventure", "Some another book title"] }
@JsonSerializable()
class QueryDto {
  const QueryDto({
    this.singleValues = const [],
    this.multipleValues = const [],
  });

  Json toJson() => _$QueryDtoToJson(this);

  final List<QuerySingleParameter> singleValues;
  final List<QueryMultipleParameter> multipleValues;
}
