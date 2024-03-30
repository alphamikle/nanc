import 'package:autoequal/autoequal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_configuration/nanc_configuration.dart';
import 'package:tools/tools.dart';

import '../../logic/fields/dynamic_field/dynamic_field_item.dart';
import '../../logic/fields/field/field.dart';

part 'structured_field_item.g.dart';

@autoequal
@CopyWith()
@JsonSerializable()
class StructuredFieldItem extends Equatable {
  const StructuredFieldItem({
    required this.items,
  });

  factory StructuredFieldItem.fromJson(dynamic json) => _$StructuredFieldItemFromJson(castToJson(json));

  factory StructuredFieldItem.fromValues(dynamic json, List<Field> fields) {
    if (json == null || json is! DJson) {
      return StructuredFieldItem(items: fields.map((Field field) => DynamicFieldItem.fromField(field)).toList());
    }
    final List<DynamicFieldItem> items = [];
    final Json effectiveJson = castToJson(json);
    for (final Field field in fields) {
      items.add(DynamicFieldItem.fromField(field, value: effectiveJson[field.id]));
    }
    return StructuredFieldItem(items: items);
  }

  factory StructuredFieldItem.fromQueryFilterFields({
    required DJson json,
    required List<Field> andOrStructure,
    required List<Field> valueStructure,
  }) {
    final List<DynamicFieldItem> items = [];
    final Json effectiveJson = castToJson(json);
    if (_isConditionFieldData(effectiveJson)) {
      for (final Field field in andOrStructure) {
        items.add(DynamicFieldItem.fromField(field, value: effectiveJson[field.id]));
      }
    } else {
      for (final Field field in valueStructure) {
        items.add(DynamicFieldItem.fromField(field, value: effectiveJson[field.id]));
      }
    }
    return StructuredFieldItem(items: items);
  }

  final List<DynamicFieldItem> items;

  List<Object?> get valueObject {
    return items.map((DynamicFieldItem child) => child.value).toList();
  }

  Json toJson() => _$StructuredFieldItemToJson(this);

  @override
  List<Object?> get props => _$props;
}

bool _isConditionFieldData(Json json) {
  final bool isWrapped = json.containsKey(QueryConditionField.conditionWrapperKey);
  final String? type = json[QueryField.typeKey]?.toString();
  final bool conditionalType = type == QueryFieldType.or.name || type == QueryFieldType.and.name;
  return isWrapped || conditionalType;
}
