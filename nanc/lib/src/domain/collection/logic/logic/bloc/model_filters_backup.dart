import 'package:autoequal/autoequal.dart';
import 'package:nanc_configuration/nanc_configuration.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

import '../../../../model/logic/model/logic/model.dart';

part 'model_filters_backup.g.dart';

@autoequal
@CopyWith(copyWithNull: true)
@JsonSerializable()
class ModelFiltersBackup extends Equatable {
  const ModelFiltersBackup({
    required this.model,
    required this.totalPages,
    required this.currentPage,
    required this.globalSearchValue,
    required this.query,
    required this.globalSearchQuery,
    required this.sort,
  });

  factory ModelFiltersBackup.fromJson(dynamic json) => _$ModelFiltersBackupFromJson(castToJson(json));

  final Model model;
  final int totalPages;
  final int currentPage;
  final String globalSearchValue;

  @JsonKey(fromJson: queryFieldFromJson, toJson: queryFieldToJson)
  final QueryField? query;

  @JsonKey(fromJson: queryFieldFromJson, toJson: queryFieldToJson)
  final QueryField? globalSearchQuery;

  final Sort? sort;

  @override
  List<Object?> get props => _$props;

  Json toJson() => _$ModelFiltersBackupToJson(this);
}
