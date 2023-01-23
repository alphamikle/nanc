import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:fields/fields.dart';
import 'package:fields/src/domain/fields/logic/field/field_description.dart';
import 'package:fields/src/domain/fields/logic/field/field_props.dart';
import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';

part 'id_field.g.dart';

@CopyWith()
@JsonSerializable()
class IdField extends Field {
  // ignore: prefer_const_constructors_in_immutables
  IdField({
    String? id,
    String? name,
    super.isRequired = true,
    super.sort,
    super.width = 400,
    super.type = FieldType.idField,
  }) : super(name: name ?? 'ID', id: id ?? 'id', showInList: true);

  factory IdField.empty() => IdField(id: '', name: '');

  factory IdField.fromJson(dynamic json) => _$IdFieldFromJson(castToJson(json));

  @override
  FieldDescription description([BuildContext? context]) {
    return const FieldDescription(
      icon: IconPack.mdi_key_chain,
      color: Color.fromRGBO(216, 124, 172, 1),
      title: 'ID field',
      description: 'A field for selecting a unique identifier. You can use any value you want or quickly generate a UUID with only one click',
    );
  }

  @override
  Json toJson() => _$IdFieldToJson(this);

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
          fieldToModelWidth,
          fieldToModelIsRequired,
        ],
      ],
    );
  }

  @override
  bool get isEmpty => this == IdField.empty();
}
