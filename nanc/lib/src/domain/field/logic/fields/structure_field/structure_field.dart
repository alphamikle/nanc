import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

import '../../type/field_types.dart';
import '../dynamic_field/dynamic_field.dart';
import '../field/field_description.dart';

part 'structure_field.g.dart';

/// ? THIS FIELD IS FOR PRIVATE PURPOSES OF THE FRAMEWORK
@autoequal
@CopyWith()
@JsonSerializable()
class StructureField extends DynamicField {
  StructureField({
    required super.name,
    String? id,
    super.showInList,
    super.isRequired,
    super.sort,
    super.validator,
    super.contentIcon,
    super.contentColor,
    super.type = FieldType.structureField,
  }) : super(id: id ?? toSnakeCase(name));

  factory StructureField.empty() => StructureField(id: '', name: '');

  factory StructureField.fromJson(dynamic json) => _$StructureFieldFromJson(castToJson(json));

  @override
  FieldDescription description([BuildContext? context]) {
    return const FieldDescription(
      icon: IconPack.mdi_wall,
      color: Color.fromRGBO(0, 0, 0, 1),
      title: 'Structure field',
      description: 'Technical field for CMS purposes',
    );
  }

  @override
  Json toJson() => _$StructureFieldToJson(this);

  @override
  List<Object?> get props => [...super.props, ..._$props];

  @override
  bool get isEmpty => this == StructureField.empty();
}
