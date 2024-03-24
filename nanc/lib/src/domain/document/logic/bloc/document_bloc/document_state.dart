import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:nanc_fields/nanc_fields.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

import '../base_document_bloc/base_page_state.dart';

part 'document_state.g.dart';

TextControllerMap _controllerMapFromJson(Json? json) => {};

Json _controllerMapToJson(TextControllerMap controllerMap) => <String, dynamic>{};

/// ? ModelId - it is the ID of the relationships model, such as "user_to_bool_rel" an etc.
typedef ThirdTableData = Map<ModelId, Map<FieldId, List<FieldId>>>;

@autoequal
@CopyWith()
@JsonSerializable()
class DocumentState extends BaseDocumentState {
  const DocumentState({
    required super.data,
    required super.initialData,
    required super.isLoading,
    required super.isDeleting,
    required super.isSaving,
    required super.controllerMap,
    required super.isError,
    required this.thirdTable,
    required this.thirdTableData,
  });

  factory DocumentState.optional({
    Json? data,
    Json? initialData,
    bool? isLoading,
    bool? isDeleting,
    bool? isSaving,
    bool? isError,
    TextControllerMap? controllerMap,
    Map<ModelId, ThirdTable>? thirdTable,
    ThirdTableData? thirdTableData,
  }) {
    return DocumentState(
      data: data ?? <String, dynamic>{},
      initialData: initialData ?? <String, dynamic>{},
      isLoading: isLoading ?? false,
      isDeleting: isDeleting ?? false,
      isSaving: isSaving ?? false,
      isError: isError ?? false,
      controllerMap: controllerMap ?? {},
      thirdTable: thirdTable ?? {},
      thirdTableData: const <ModelId, Map<FieldId, List<FieldId>>>{},
    );
  }

  factory DocumentState.empty() => const DocumentState(
        data: <String, dynamic>{},
        initialData: <String, dynamic>{},
        thirdTableData: <ModelId, Map<FieldId, List<FieldId>>>{},
        isLoading: false,
        isDeleting: false,
        isSaving: false,
        isError: false,
        controllerMap: {},
        thirdTable: {},
      );

  factory DocumentState.fromJson(dynamic json) => _$DocumentStateFromJson(castToJson(json));

  final ThirdTableData thirdTableData;
  final Map<ModelId, ThirdTable> thirdTable;

  @override
  bool get isChanged {
    return super.isChanged || thirdTableData.isNotEmpty;
  }

  @override
  Json toJson() => _$DocumentStateToJson(this);

  @override
  List<Object?> get props => [...super.props, ..._$props];
}
