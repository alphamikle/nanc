import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

import '../../../config/logic/network_config.dart';

part 'collection_response_dto.g.dart';

int _totalPagesFinder(DJson parentObject, String defaultKey) {
  final dynamic value = parentObject[NetworkConfig.paginationTotalPagesParameterName];
  if (value is int) {
    return value;
  }
  logg('Not found "${NetworkConfig.paginationTotalPagesParameterName}" key in the parent object with data:\n$parentObject');
  return 0;
}

int _pageNumberFinder(DJson parentObject, String defaultKey) {
  final dynamic value = parentObject[NetworkConfig.paginationPageNumberParameterName];
  if (value is int) {
    return value;
  }
  logg('Not found "${NetworkConfig.paginationPageNumberParameterName}" key in the parent object with data:\n$parentObject');
  return 1;
}

List<Json> _dataContainerFinder(DJson parentObject, String defaultKey) {
  final dynamic value = parentObject[NetworkConfig.paginationDataContainerParameterName];
  if (value is List<Json>) {
    return value;
  } else if (value is List<DJson>) {
    return value.map(castToJson).toList();
  }
  logg('Not found "${NetworkConfig.paginationDataContainerParameterName}" key in the parent object with data:\n$parentObject');
  return [];
}

@autoequal
@CopyWith()
@JsonSerializable()
class CollectionResponseDto extends Equatable {
  const CollectionResponseDto({
    required this.page,
    required this.totalPages,
    required this.data,
  });

  factory CollectionResponseDto.fromJson(dynamic json) => _$CollectionResponseDtoFromJson(castToJson(json));

  @JsonKey(readValue: _pageNumberFinder)
  final int page;

  @JsonKey(readValue: _totalPagesFinder)
  final int totalPages;

  @JsonKey(readValue: _dataContainerFinder)
  final List<Json> data;

  Json toJson() => _$CollectionResponseDtoToJson(this);

  @override
  List<Object?> get props => _$props;
}
