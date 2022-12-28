// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:config/config.dart';
import 'package:equatable/equatable.dart';
import 'package:fields/src/domain/fields/logic/field/field_description.dart';
import 'package:fields/src/domain/fields/logic/field/field_props.dart';
import 'package:fields/src/domain/type/field_types.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';

abstract class Field extends Equatable {
  const Field({
    required this.id,
    required this.name,
    this.showInList = true,
    this.isRequired = false,
    this.sort = 0,
    this.width,
    this.validator,
    this.type = FieldType.field,
  });

  final String id;
  final String name;
  final bool showInList;
  final bool isRequired;
  final int sort;
  final double? width;

  @JsonKey(ignore: true)
  final FormFieldValidator<Object>? validator;

  final FieldType type;

  FieldDescription description([BuildContext? context]);

  Json toJson();

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
        ],
        [
          fieldToModelShowInList,
          fieldToModelIsRequired,
        ],
        [
          // TODO(alphamikle): Make code field
          if (Env.isRealCMS) fieldToModelValidator,
        ],
      ],
    );
  }

  Set<String> get defaultValues => {
        fieldIsRequiredProperty,
        fieldShowInListProperty,
      };

  bool get isEmpty;

  @override
  List<Object?> get props => [
        id,
        sort,
        name,
        showInList,
        isRequired,
        width,
        validator,
        type,
      ];
}
