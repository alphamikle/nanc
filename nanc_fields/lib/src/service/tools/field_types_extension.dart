import '../../domain/fields/logic/bool_field/bool_field.dart';
import '../../domain/fields/logic/color_field/color_field.dart';
import '../../domain/fields/logic/date_time_field/date_time_field.dart';
import '../../domain/fields/logic/enum_field/enum_field.dart';
import '../../domain/fields/logic/field/field.dart';
import '../../domain/fields/logic/font_field/font_field.dart';
import '../../domain/fields/logic/icon_field/icon_field.dart';
import '../../domain/fields/logic/id_field/id_field.dart';
import '../../domain/fields/logic/number_field/number_field.dart';
import '../../domain/fields/logic/selector_field/selector_field.dart';
import '../../domain/fields/logic/string_field/string_field.dart';

extension FieldTypesExtension on Field? {
  bool get isNumeric {
    return this != null && this is NumberField;
  }

  bool get isString {
    return this != null &&
        (this is StringField || this is EnumField || this is ColorField || this is FontField || this is IconField || this is IdField || this is SelectorField);
  }

  bool get isBool {
    return this != null && this is BoolField;
  }

  bool get isDateTime {
    return this != null && this is DateTimeField;
  }
}
