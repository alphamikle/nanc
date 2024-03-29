// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:autoequal/autoequal.dart';
import 'package:nanc_configuration/nanc_configuration.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

import '../../../../model/logic/model/logic/model.dart';
import '../../type/field_types.dart';
import 'field_description.dart';
import 'field_props.dart';

part 'field.g.dart';

@autoequal
abstract class Field extends Equatable implements IField {
  const Field({
    required this.id,
    required this.name,
    this.showInList = false,
    this.isRequired = false,
    this.sort = 0,
    this.realField = true,
    this.validator,
    this.type = FieldType.field,
  });

  @override
  final String id;

  @override
  final String name;

  @override
  final bool showInList;

  @override
  final bool isRequired;

  @override
  final int sort;

  @override
  final bool realField;

  @override
  List<Field> get virtualFields => [];

  @override
  @JsonKey(ignore: true)
  final FormFieldValidator<Object>? validator;

  @override
  final FieldType type;

  @override
  FieldDescription description([BuildContext? context]);

  @override
  Json toJson();

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
        // TODO(alphamikle): Make code field
        // [
        //   if (Env.isRealCMS) fieldToModelValidator,
        // ],
      ],
    );
  }

  @override
  Set<String> get defaultValues => {
        fieldIsRequiredProperty,
        fieldShowInListProperty,
      };

  @override
  bool get isEmpty;

  @override
  List<Object?> get props => _$props;
}
