import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:fields/src/domain/fields/logic/field/field.dart';
import 'package:fields/src/domain/fields/logic/field/field_description.dart';
import 'package:fields/src/domain/type/field_types.dart';
import 'package:fields/src/service/tools/json_factories.dart';
import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'group_field.g.dart';

@CopyWith()
@JsonSerializable()
class GroupField extends Field {
  GroupField({
    required super.name,
    required this.fields,
    String? id,
    super.showInList,
    super.isRequired,
    super.sort,
    super.width,
    super.validator,
    super.type = FieldType.groupField,
  }) : super(id: id ?? toSnackCase(name));

  factory GroupField.empty() => GroupField(id: '', name: '', fields: const []);

  factory GroupField.fromJson(dynamic json) => _$GroupFieldFromJson(castToJson(json));

  @JsonKey(fromJson: fieldsFromJsonRow, toJson: fieldsToJsonRow)
  final List<Field> fields;

  @override
  FieldDescription description([BuildContext? context]) {
    return const FieldDescription(
      icon: IconPack.flu_group_regular,
      color: Color.fromRGBO(130, 113, 145, 1),
      title: 'Fields Group',
      description: 'Group of the several fields in the one root object',
    );
  }

  @override
  Json toJson() => _$GroupFieldToJson(this);

  @override
  bool get isEmpty => this == GroupField.empty();
}
