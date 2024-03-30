import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_icons/nanc_icons.dart';
import 'package:tools/tools.dart';

import '../../type/field_types.dart';
import '../field/field.dart';
import '../field/field_description.dart';

part 'binary_field.g.dart';

@autoequal
@CopyWith()
@JsonSerializable()
class BinaryField extends Field {
  BinaryField({
    required super.name,
    String? id,
    super.showInList,
    super.isRequired,
    super.sort,
    super.validator,
    super.type = FieldType.binaryField,
  }) : super(id: id ?? toSnakeCase(name));

  factory BinaryField.empty() => BinaryField(id: '', name: '');

  factory BinaryField.fromJson(dynamic json) => _$BinaryFieldFromJson(castToJson(json));

  @override
  FieldDescription description([BuildContext? context]) {
    return const FieldDescription(
      icon: IconPack.flu_document_100_filled,
      color: Color.fromRGBO(34, 79, 17, 1),
      title: 'Binary field',
      description: 'Special field for internal purposes using',
    );
  }

  @override
  List<Object?> get props => _$props;

  @override
  Json toJson() => _$BinaryFieldToJson(this);

  @override
  bool get isEmpty => this == BinaryField.empty();
}
