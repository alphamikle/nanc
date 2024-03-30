import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_configuration/nanc_configuration.dart';
import 'package:tools/tools.dart';

import '../../../../model/logic/model/logic/model.dart';
import 'model_filters_backup.dart';

part 'collection_state.g.dart';

@autoequal
@CopyWith(copyWithNull: true)
@JsonSerializable()
class CollectionState extends Equatable {
  const CollectionState({
    required this.dataRows,
    required this.model,
    required this.currentPage,
    required this.totalPages,
    required this.isLoading,
    required this.isError,
    required this.notFoundAnything,
    required this.query,
    required this.globalSearchQuery,
    required this.sort,
    required this.filtersBackup,
  });

  factory CollectionState.empty() => CollectionState(
        dataRows: const [],
        model: Model.empty(),
        currentPage: 0,
        totalPages: 0,
        isLoading: false,
        isError: false,
        notFoundAnything: false,
        query: null,
        globalSearchQuery: null,
        sort: null,
        filtersBackup: const {},
      );

  factory CollectionState.fromJson(dynamic json) => _$CollectionStateFromJson(castToJson(json));

  final List<Json> dataRows;
  final Model model;
  final int currentPage;
  final int totalPages;
  final bool isLoading;
  final bool isError;
  final bool notFoundAnything;

  @JsonKey(fromJson: queryFieldFromJson, toJson: queryFieldToJson)
  final QueryField? query;

  @JsonKey(fromJson: queryFieldFromJson, toJson: queryFieldToJson)
  final QueryField? globalSearchQuery;

  final Map<ModelId, ModelFiltersBackup> filtersBackup;

  final Sort? sort;

  ModelFiltersBackup get modelFiltersBackup => filtersBackup[model.id]!;

  @override
  List<Object?> get props => _$props;

  Json toJson() => _$CollectionStateToJson(this);
}
