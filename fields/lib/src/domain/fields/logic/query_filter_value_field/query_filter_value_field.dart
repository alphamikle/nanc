import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

import '../../../../../fields.dart';

part 'query_filter_value_field.g.dart';

@autoequal
@CopyWith()
@JsonSerializable()
class QueryFilterValueField extends Field {
  QueryFilterValueField({
    required super.name,
    String? id,
    super.showInList,
    super.isRequired,
    super.sort,
    super.width,
    super.validator,
    super.type = FieldType.queryFilterValueField,
  }) : super(id: id ?? toSnakeCase(name));

  factory QueryFilterValueField.fromJson(dynamic json) => _$QueryFilterValueFieldFromJson(castToJson(json));

  factory QueryFilterValueField.empty() => QueryFilterValueField(name: '');

  @override
  FieldDescription description([BuildContext? context]) {
    return const FieldDescription(
      icon: IconPack.mdi_playlist_edit,
      color: Color.fromRGBO(245, 163, 98, 1),
      title: 'Query filter value field',
      description: 'A fields, which is a representation of the filtering value',
    );
  }

  @override
  Json toJson() => _$QueryFilterValueFieldToJson(this);

  @override
  bool get isEmpty => this == QueryFilterValueField.empty();

  @override
  List<Object?> get props => [...super.props, ..._$props];
}
