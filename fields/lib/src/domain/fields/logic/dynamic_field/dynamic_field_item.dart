import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

import '../../../mapper/field_mapper.dart';
import '../field/field.dart';

part 'dynamic_field_item.g.dart';

// ignore: prefer_void_to_null
Null _controllerToJson(TextEditingController controller) => null;

TextEditingController _controllerFromJson(Object? value) => TextEditingController(text: value == null ? '' : value.toString());

Object? _readDataForTheController(Map<dynamic, dynamic> data, String fieldName) => data[DynamicFieldItem.valuePropName];

Json _fieldToJson(Field field) => FieldMapper.fieldToJson(field);

Field _fieldFromJson(dynamic json) => FieldMapper.jsonToField(json);

bool isScalar(dynamic value) {
  if (value is String || value is num || value is bool) {
    return true;
  }
  return false;
}

Json _toStructureObject(Json listFieldItemJson) {
  listFieldItemJson.remove(DynamicFieldItem.controllerPropName);
  listFieldItemJson.remove(DynamicFieldItem.valuePropName);
  listFieldItemJson[DynamicFieldItem.childrenPropName] = (listFieldItemJson[DynamicFieldItem.childrenPropName] as List<dynamic>)
      .map<dynamic>(
        (dynamic child) => _toStructureObject(
          castToJson(child),
        ),
      )
      .toList();
  return listFieldItemJson;
}

@autoequal
@CopyWith()
@JsonSerializable()
class DynamicFieldItem extends Equatable {
  const DynamicFieldItem({
    required this.controller,
    required this.value,
    required this.field,
    this.children = const [],
  });

  factory DynamicFieldItem.fromJson(dynamic json) => _$DynamicFieldItemFromJson(castToJson(json));

  factory DynamicFieldItem.fromField(Field field, {Object? value}) {
    final TextEditingController controller = TextEditingController();
    if (value != null && isScalar(value)) {
      controller.text = value.toString();
    }
    return DynamicFieldItem(controller: controller, value: value, field: field);
  }

  static const String controllerPropName = 'controller';
  static const String valuePropName = 'value';
  static const String childrenPropName = 'children';

  @JsonKey(toJson: _controllerToJson, fromJson: _controllerFromJson, readValue: _readDataForTheController)
  final TextEditingController controller;

  final Object? value;

  @JsonKey(toJson: _fieldToJson, fromJson: _fieldFromJson)
  final Field field;

  final List<DynamicFieldItem> children;

  Json get valueObject {
    return <String, dynamic>{
      field.id: value,
    };
  }

  Json get structureObject => _toStructureObject(toJson());

  Json toJson() => _$DynamicFieldItemToJson(this);

  @override
  List<Object?> get props => _$props;
}
