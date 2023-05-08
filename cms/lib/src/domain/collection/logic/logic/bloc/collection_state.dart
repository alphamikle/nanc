import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_config/nanc_config.dart';
import 'package:tools/tools.dart';

part 'collection_state.g.dart';

@autoequal
@CopyWith()
@JsonSerializable()
class CollectionState extends Equatable {
  const CollectionState({
    required this.dataRows,
    required this.modelId,
    required this.currentPage,
    required this.totalPages,
    required this.isLoading,
    required this.notFoundAnything,
    required this.query,
  });

  factory CollectionState.empty() => const CollectionState(
        dataRows: [],
        modelId: '',
        currentPage: 0,
        totalPages: 0,
        isLoading: false,
        notFoundAnything: false,
        query: null,
      );

  factory CollectionState.fromJson(dynamic json) => _$CollectionStateFromJson(castToJson(json));

  final List<Json> dataRows;
  final String modelId;
  final int currentPage;
  final int totalPages;
  final bool isLoading;
  final bool notFoundAnything;

  @JsonKey(fromJson: queryFieldFromJson, toJson: queryFieldToJson)
  final QueryField? query;

  @override
  List<Object?> get props => _$props;

  Json toJson() => _$CollectionStateToJson(this);
}
