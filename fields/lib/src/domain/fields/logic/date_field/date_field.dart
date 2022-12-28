import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:fields/src/domain/fields/logic/field/field.dart';
import 'package:fields/src/domain/fields/logic/field/field_description.dart';
import 'package:fields/src/domain/type/field_types.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

part 'date_field.g.dart';

@CopyWith()
@JsonSerializable()
class DateField extends Field {
  DateField({
    required super.name,
    String? id,
    super.showInList,
    super.isRequired,
    super.sort,
    super.width,
    super.validator,
    super.type = FieldType.dateField,
  }) : super(id: id ?? toSnackCase(name));

  factory DateField.empty() => DateField(id: '', name: '');

  factory DateField.fromJson(dynamic json) => _$DateFieldFromJson(castToJson(json));

  @override
  FieldDescription description([BuildContext? context]) {
    return const FieldDescription(
      icon: MdiIcons.calendarClock,
      color: Color.fromRGBO(216, 49, 91, 1),
      title: 'Date field',
      description: 'A field for setting the date and time with automatic validation of correct input',
    );
  }

  @override
  Json toJson() => _$DateFieldToJson(this);

  @override
  bool get isEmpty => this == DateField.empty();
}
