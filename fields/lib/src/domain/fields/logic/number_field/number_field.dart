import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';

import '../../../../../fields.dart';

part 'number_field.g.dart';

enum NumberType {
  bit,
  float,
  double,
  tinyInt,
  smallInt,
  mediumInt,
  integer,
  bigInt;

  bool get isBit => this == NumberType.bit;
  bool get isFloat => this == NumberType.float;
  bool get isDouble => this == NumberType.double;
  bool get isTinyInt => this == NumberType.tinyInt;
  bool get isSmallInt => this == NumberType.smallInt;
  bool get isMediumInt => this == NumberType.mediumInt;
  bool get isInteger => this == NumberType.integer;
  bool get isBigInt => this == NumberType.bigInt;
}

enum SignType {
  unsigned,
  signed;

  bool get isSigned => this == SignType.signed;
  bool get isUnsigned => this == SignType.unsigned;
}

@autoequal
@CopyWith()
@JsonSerializable()
class NumberField extends Field {
  NumberField({
    required super.name,
    String? id,
    this.numberType = NumberType.float,
    this.signType = SignType.signed,
    super.showInList,
    super.isRequired,
    super.sort,
    super.validator,
    super.type = FieldType.numberField,
  }) : super(id: id ?? toSnakeCase(name));

  factory NumberField.empty() => NumberField(id: '', name: '');

  factory NumberField.fromJson(dynamic json) => _$NumberFieldFromJson(castToJson(json));

  @JsonKey(unknownEnumValue: NumberType.float)
  final NumberType numberType;

  @JsonKey(unknownEnumValue: SignType.signed)
  final SignType signType;

  @override
  FieldDescription description([BuildContext? context]) {
    return const FieldDescription(
      icon: IconPack.mdi_numeric,
      color: Color.fromRGBO(133, 153, 71, 1),
      title: 'Number field',
      description: 'Field for entering numbers of any type - int, bit, float, etc.',
    );
  }

  @override
  Json toJson() => _$NumberFieldToJson(this);

  @override
  Model toModel() {
    return Model(
      name: description().title,
      icon: IconPackNames.mdi_numeric,
      fields: [
        [
          fieldToModelName,
          fieldToModelId,
        ],
        [
          EnumField(
            id: 'numberType',
            name: 'Number Type',
            isRequired: true,
            values: [
              EnumValue(title: 'Bit', value: NumberType.bit.name),
              EnumValue(title: 'Float', value: NumberType.float.name),
              EnumValue(title: 'Double', value: NumberType.double.name),
              EnumValue(title: 'Tiny Int', value: NumberType.tinyInt.name),
              EnumValue(title: 'Small Int', value: NumberType.smallInt.name),
              EnumValue(title: 'Medium Int', value: NumberType.mediumInt.name),
              EnumValue(title: 'Integer', value: NumberType.integer.name),
              EnumValue(title: 'Big Int', value: NumberType.bigInt.name),
            ],
          ),
          EnumField(
            id: 'signType',
            name: 'Sign Type',
            isRequired: true,
            values: [
              EnumValue(title: 'Signed', value: SignType.signed.name),
              EnumValue(title: 'Unsigned', value: SignType.unsigned.name),
            ],
          ),
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
  bool get isEmpty => this == NumberField.empty();
}
