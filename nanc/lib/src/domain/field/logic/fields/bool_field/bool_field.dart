import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_icons/nanc_icons.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../../../../model/logic/model/logic/model.dart';
import '../../type/field_types.dart';
import '../field/field.dart';
import '../field/field_description.dart';
import '../field/field_props.dart';

part 'bool_field.g.dart';

@autoequal
@CopyWith()
@JsonSerializable()
class BoolField extends Field {
  BoolField({
    required super.name,
    String? id,
    this.defaultValue = false,
    super.isRequired,
    super.showInList,
    super.sort,
    super.validator,
    super.type = FieldType.boolField,
  }) : super(id: id ?? toSnakeCase(name));

  factory BoolField.empty() => BoolField(id: '', name: '');

  factory BoolField.fromJson(dynamic json) => _$BoolFieldFromJson(castToJson(json));

  final bool defaultValue;

  @override
  FieldDescription description([BuildContext? context]) {
    return const FieldDescription(
      icon: IconPack.flu_toggle_left_regular,
      color: Color.fromRGBO(64, 132, 243, 1),
      title: 'Boolean field',
      description: 'A primitive bool type field, with the possibility of setting a default value',
    );
  }

  @override
  Json toJson() => _$BoolFieldToJson(this);

  @override
  Model toModel() {
    return Model(
      name: description().title,
      icon: IconPackNames.flu_toggle_left_regular,
      fields: [
        [
          fieldToModelName,
          fieldToModelId,
        ],
        [
          fieldToModelSort,
          fieldToModelShowInList,
          fieldToModelDefaultValue,
        ],
      ],
    );
  }

  @override
  Set<String> get defaultValues => {
        ...super.defaultValues,
        'defaultValue',
      };

  @override
  List<Object?> get props => [...super.props, ..._$props];

  @override
  bool get isEmpty => this == BoolField.empty();
}
