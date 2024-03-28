import 'package:autoequal/autoequal.dart';
import 'package:config/config.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

import '../../../../model/logic/model/logic/model.dart';
import '../../type/field_types.dart';
import '../field/field.dart';
import '../field/field_description.dart';
import '../field/field_props.dart';

part 'id_field.g.dart';

@autoequal
@CopyWith()
@JsonSerializable()
class IdField extends Field implements IIdField {
  // ignore: prefer_const_constructors_in_immutables
  IdField({
    String? id,
    String? name,
    super.showInList = true,
    super.isRequired = true,
    super.sort,
    this.isStub = false,
    super.type = FieldType.idField,
  }) : super(name: name ?? 'ID', id: id ?? 'id');

  factory IdField.empty() => IdField(id: '', name: '');

  factory IdField.fromJson(dynamic json) => _$IdFieldFromJson(castToJson(json));

  @override
  FieldDescription description([BuildContext? context]) {
    return const FieldDescription(
      icon: IconPack.mdi_key_chain,
      color: Color.fromRGBO(59, 165, 69, 1),
      title: 'ID field',
      description: 'A field for selecting a unique identifier. You can use any value you want or quickly generate a UUID with only one click',
    );
  }

  @override
  final bool isStub;

  @override
  Json toJson() => _$IdFieldToJson(this);

  @override
  Model toModel() {
    return Model(
      name: description().title,
      icon: IconPackNames.mdi_key_chain,
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
      ],
    );
  }

  @override
  List<Object?> get props => [...super.props, ..._$props];

  @override
  bool get isEmpty => this == IdField.empty();
}
