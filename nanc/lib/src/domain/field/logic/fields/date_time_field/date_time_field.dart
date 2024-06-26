import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_icons/nanc_icons.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../../../../model/logic/model/logic/model.dart';
import '../../type/field_types.dart';
import '../bool_field/bool_field.dart';
import '../field/field.dart';
import '../field/field_description.dart';
import '../field/field_props.dart';

part 'date_time_field.g.dart';

@autoequal
@CopyWith()
@JsonSerializable()
class DateTimeField extends Field {
  DateTimeField({
    required super.name,
    this.isCreatedAtField = false,
    this.isUpdatedAtField = false,
    String? id,
    super.showInList,
    super.isRequired,
    super.sort,
    super.validator,
    super.type = FieldType.dateField,
  }) : super(id: id ?? toSnakeCase(name));

  factory DateTimeField.empty() => DateTimeField(id: '', name: '');

  factory DateTimeField.fromJson(dynamic json) => _$DateTimeFieldFromJson(castToJson(json));

  final bool isCreatedAtField;
  final bool isUpdatedAtField;

  @override
  FieldDescription description([BuildContext? context]) {
    return const FieldDescription(
      icon: IconPack.flu_calendar_clock_filled,
      color: Color.fromRGBO(40, 158, 144, 1),
      title: 'Date Time field',
      description: 'A field for setting the date and time with automatic validation of correct input',
    );
  }

  @override
  Json toJson() => _$DateTimeFieldToJson(this);

  @override
  Model toModel() {
    return Model(
      name: description().title,
      icon: IconPackNames.flu_calendar_clock_filled,
      fields: [
        [
          fieldToModelName,
          fieldToModelId,
        ],
        [
          fieldToModelSort,
          fieldToModelShowInList,
        ],
        [
          fieldToModelIsRequired,
          BoolField(id: 'isCreatedAtField', name: 'Is createdAt field?'),
          BoolField(id: 'isUpdatedAtField', name: 'Is updatedAt field?'),
        ],
      ],
    );
  }

  @override
  List<Object?> get props => [...super.props, ..._$props];

  @override
  bool get isEmpty => this == DateTimeField.empty();
}
