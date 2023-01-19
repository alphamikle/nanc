import 'package:cms/src/domain/page/logic/bloc/base_entity_page_bloc/base_page_state.dart';
import 'package:cms/src/domain/page/logic/bloc/page_bloc/entity_page_bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:fields/fields.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'page_state.g.dart';

TextControllerMap _controllerMapFromJson(Json? json) => {};

Json _controllerMapToJson(TextControllerMap controllerMap) => <String, dynamic>{};

typedef ModelId = String;
typedef ThirdTableData = Map<ModelId, Map<ParentEntityDataId, List<ChildEntityDataId>>>;

@CopyWith()
@JsonSerializable()
class PageState extends BaseEntityPageState {
  const PageState({
    required super.data,
    required super.initialData,
    required super.isLoading,
    required super.isDeleting,
    required super.isSaving,
    required super.controllerMap,
    required this.thirdTable,
    required this.thirdTableData,
  });

  factory PageState.empty() => PageState(
        data: const <String, dynamic>{},
        initialData: const <String, dynamic>{},
        thirdTableData: const <ModelId, Map<ParentEntityDataId, List<ChildEntityDataId>>>{},
        isLoading: false,
        isDeleting: false,
        isSaving: false,
        controllerMap: const {},
        thirdTable: ThirdTable.empty(),
      );

  factory PageState.fromJson(dynamic json) => _$PageStateFromJson(castToJson(json));

  final ThirdTableData thirdTableData;
  final ThirdTable thirdTable;

  @override
  bool get isChanged {
    return super.isChanged || thirdTableData.isNotEmpty;
  }

  @override
  Json toJson() => _$PageStateToJson(this);

  @override
  List<Object?> get props => [
        ...super.props,
        thirdTableData,
        thirdTable,
      ];
}
