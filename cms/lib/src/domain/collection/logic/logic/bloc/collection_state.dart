import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'collection_state.g.dart';

@autoequal
@CopyWith()
@JsonSerializable()
class CollectionState extends Equatable {
  const CollectionState({
    required this.dataRows,
    required this.currentPage,
    required this.totalPages,
    required this.isLoading,
  });

  factory CollectionState.empty() => const CollectionState(dataRows: [], currentPage: 0, totalPages: 0, isLoading: false);

  factory CollectionState.fromJson(dynamic json) => _$CollectionStateFromJson(castToJson(json));

  final List<Json> dataRows;
  final int currentPage;
  final int totalPages;
  final bool isLoading;

  @override
  List<Object?> get props => _$props;

  Json toJson() => _$CollectionStateToJson(this);
}
