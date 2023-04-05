import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/tools.dart';

import '../../logic/dynamic_field/dynamic_field_item.dart';
import '../../logic/field/field.dart';

part 'structured_field_item.g.dart';

@CopyWith()
@JsonSerializable()
class StructuredFieldItem {
  const StructuredFieldItem({
    required this.items,
  });

  factory StructuredFieldItem.fromJson(dynamic json) => _$StructuredFieldItemFromJson(castToJson(json));

  factory StructuredFieldItem.fromValues(dynamic json, List<Field> fields) {
    if (json == null || json is! Map) {
      return StructuredFieldItem(items: fields.map((Field field) => DynamicFieldItem.fromField(field)).toList());
    }
    final List<DynamicFieldItem> items = [];
    final Json effectiveJson = castToJson(json);
    for (final Field field in fields) {
      items.add(DynamicFieldItem.fromField(field, value: effectiveJson[field.id]));
    }
    return StructuredFieldItem(items: items);
  }

  final List<DynamicFieldItem> items;

  List<Object?> get valueObject {
    return items.map((DynamicFieldItem child) => child.value).toList();
  }

  Json toJson() => _$StructuredFieldItemToJson(this);

  List<Object?> get props {
    return [
      items,
    ];
  }
}
