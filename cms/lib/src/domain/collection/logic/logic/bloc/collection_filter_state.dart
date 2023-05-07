import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';

part 'collection_filter_state.g.dart';

@autoequal
@CopyWith()
@JsonSerializable()
class CollectionFilterState extends Equatable {
  const CollectionFilterState({
    required this.collectionModel,
  });

  factory CollectionFilterState.fromJson(dynamic json) => _$CollectionFilterStateFromJson(castToJson(json));

  factory CollectionFilterState.empty() => CollectionFilterState(collectionModel: Model.empty());

  final Model collectionModel;

  @override
  List<Object?> get props => _$props;

  Json toJson() => _$CollectionFilterStateToJson(this);
}
