import 'package:json_annotation/json_annotation.dart';
import 'package:nanc_tools/nanc_tools.dart';

part 'title_fields.g.dart';

enum TitleFieldType {
  externalField,
  fieldsDivider,
  fieldsDecorator,
}

abstract class TitleField {
  const TitleField();

  TitleFieldType? get type;
  String? get value;
  String get strictValue => value!;
  bool get isValid;
  bool get isNotValid => isValid == false;

  Json toJson();
}

@JsonSerializable()
class ExternalField extends TitleField {
  factory ExternalField({
    TitleFieldType? type,
    String? id,
    String? value,
  }) {
    if (type == null && id != null) {
      return ExternalField.id(id);
    } else if (type == TitleFieldType.externalField && value != null) {
      return ExternalField.id(value);
    }
    return const ExternalField._(id: null, type: null);
  }

  const ExternalField.id(this.id) : type = TitleFieldType.externalField;

  const ExternalField._({
    required this.type,
    required this.id,
  });

  factory ExternalField.fromJson(dynamic json) => _$ExternalFieldFromJson(castToJson(json));

  @override
  final TitleFieldType? type;
  final String? id;

  @override
  String? get value => id;

  @override
  bool get isValid => id != null && id!.isNotEmpty;

  @override
  Json toJson() => _$ExternalFieldToJson(this);
}

@JsonSerializable()
class FieldsDivider extends TitleField {
  factory FieldsDivider({
    TitleFieldType? type,
    String? divider,
    String? value,
  }) {
    if (type == null && divider != null) {
      return FieldsDivider.divider(divider);
    } else if (type == TitleFieldType.fieldsDivider && value != null) {
      return FieldsDivider.divider(value);
    }
    return const FieldsDivider._(divider: null, type: null);
  }

  const FieldsDivider.divider(this.divider) : type = TitleFieldType.fieldsDivider;

  const FieldsDivider._({
    required this.type,
    required this.divider,
  });

  factory FieldsDivider.fromJson(dynamic json) => _$FieldsDividerFromJson(castToJson(json));

  @override
  final TitleFieldType? type;
  final String? divider;

  @override
  String? get value => divider;

  @override
  bool get isValid => divider != null && divider!.isNotEmpty;

  @override
  Json toJson() => _$FieldsDividerToJson(this);
}

@JsonSerializable()
class FieldsDecorator extends TitleField {
  factory FieldsDecorator({
    TitleFieldType? type,
    String? decorator,
    String? value,
  }) {
    if (type == null && decorator != null) {
      return FieldsDecorator.decorator(decorator);
    } else if (type == TitleFieldType.fieldsDecorator && value != null) {
      return FieldsDecorator.decorator(value);
    }
    return const FieldsDecorator._(decorator: null, type: null);
  }

  const FieldsDecorator.decorator(this.decorator) : type = TitleFieldType.fieldsDecorator;

  const FieldsDecorator._({
    required this.type,
    required this.decorator,
  });

  factory FieldsDecorator.fromJson(dynamic json) => _$FieldsDecoratorFromJson(castToJson(json));

  @override
  final TitleFieldType? type;
  final String? decorator;

  @override
  String? get value => decorator;

  @override
  bool get isValid => decorator != null && decorator!.isNotEmpty;

  @override
  Json toJson() => _$FieldsDecoratorToJson(this);
}

TitleField titleFieldFromJson(dynamic json) {
  if (json is Map) {
    final ExternalField externalField = ExternalField.fromJson(json);
    if (externalField.isValid) {
      return externalField;
    }

    final FieldsDecorator fieldsDecorator = FieldsDecorator.fromJson(json);
    if (fieldsDecorator.isValid) {
      return fieldsDecorator;
    }

    final FieldsDivider fieldsDivider = FieldsDivider.fromJson(json);
    if (fieldsDivider.isValid) {
      return fieldsDivider;
    }
  }
  return FieldsDivider(divider: ' ', type: TitleFieldType.fieldsDivider);
}

List<TitleField> titleFieldsFromJson(dynamic json) {
  if (json is List) {
    return json.map(titleFieldFromJson).toList();
  }
  return [];
}

Json titleFieldToJson(TitleField titleField) {
  if (titleField is ExternalField) {
    return titleField.toJson();
  } else if (titleField is FieldsDivider) {
    return titleField.toJson();
  } else if (titleField is FieldsDecorator) {
    return titleField.toJson();
  }
  return <String, dynamic>{};
}

List<Json> titleFieldsToJson(List<TitleField> titleFields) {
  return titleFields.map(titleFieldToJson).toList();
}

extension TitleFieldsTools on List<TitleField> {
  List<String> toFieldsIds() {
    return whereType<ExternalField>().where((ExternalField it) => it.isValid).map((ExternalField it) => it.id!).toList();
  }

  List<String> toTitleSegments(DJson data) {
    final List<String> titleSegments = [];
    for (int i = 0; i < length; i++) {
      final TitleField titleField = this[i];
      final bool isLast = i == length - 1;
      final bool isFirst = i == 0;
      TitleField? prevField = isFirst ? null : this[i - 1];
      TitleField? nextField = isLast ? null : this[i + 1];
      if (prevField != null && prevField.isNotValid) {
        prevField = null;
      }
      if (nextField != null && nextField.isNotValid) {
        nextField = null;
      }
      if (titleField.isNotValid) {
        continue;
      }
      if (titleField is FieldsDecorator) {
        titleSegments.add(titleField.strictValue);
      } else if (titleField is FieldsDivider) {
        if (prevField != null && prevField is ExternalField && nextField != null && nextField is ExternalField) {
          titleSegments.add(titleField.strictValue);
        }
      } else if (titleField is ExternalField) {
        final Object? value = data[titleField.strictValue];
        if (prevField != null && prevField is ExternalField) {
          /// ? Default divider if there are no one [FieldsDivider] between [ExternalField]s
          titleSegments.add(' ');
        }
        if (value == null) {
          titleSegments.add('null');
        } else if (value is String || value is num || value is bool) {
          titleSegments.add(value.toString());
        } else {
          titleSegments.add('Object(${value.runtimeType})');
        }
      }
    }
    return titleSegments;
  }
}
