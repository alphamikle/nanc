import '../fields/bool_field/bool_field.dart';
import '../fields/color_field/color_field.dart';
import '../fields/date_time_field/date_time_field.dart';
import '../fields/enum_field/enum_field.dart';
import '../fields/field/field.dart';
import '../fields/font_field/font_field.dart';
import '../fields/icon_field/icon_field.dart';
import '../fields/id_field/id_field.dart';
import '../fields/number_field/number_field.dart';
import '../fields/selector_field/selector_field.dart';
import '../fields/string_field/string_field.dart';

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
