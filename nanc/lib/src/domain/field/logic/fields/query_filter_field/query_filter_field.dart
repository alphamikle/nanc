import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:nanc_icons/nanc_icons.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

import '../../../../model/logic/model/logic/model.dart';
import '../../type/field_types.dart';
import '../dynamic_field/dynamic_field.dart';
import '../field/field_description.dart';
import '../field/field_props.dart';

part 'query_filter_field.g.dart';

@autoequal
@CopyWith()
@JsonSerializable()
class QueryFilterField extends DynamicField {
  QueryFilterField({
    required super.name,
    String? id,
    super.showInList,
    super.isRequired,
    super.sort,
    super.validator,
    super.contentIcon,
    super.contentColor,
    super.type = FieldType.queryFilterField,
  }) : super(id: id ?? toSnakeCase(name));

  factory QueryFilterField.empty() => QueryFilterField(id: '', name: '');

  factory QueryFilterField.fromJson(dynamic json) => _$QueryFilterFieldFromJson(castToJson(json));

  @override
  FieldDescription description([BuildContext? context]) {
    return const FieldDescription(
      icon: IconPack.flu_code_block_regular,
      color: Color.fromRGBO(31, 60, 166, 1),
      title: 'Query filter field',
      description: 'Field to help filter collections',
    );
  }

  @override
  Json toJson() => _$QueryFilterFieldToJson(this);

  @override
  Model toModel() {
    return Model(
      name: description().title,
      icon: 'key',
      fields: [
        [
          fieldToModelName,
          fieldToModelId,
        ],
        [
          fieldToModelSort,
          fieldToModelShowInList,
          fieldToModelIsRequired,
        ],
        [
          fieldToModelContentColor,
          fieldToModelContentIcon,
        ],
      ],
    );
  }

  @override
  List<Object?> get props => [...super.props, ..._$props];

  @override
  bool get isEmpty => this == QueryFilterField.empty();
}
