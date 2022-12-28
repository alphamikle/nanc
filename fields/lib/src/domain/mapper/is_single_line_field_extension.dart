import 'package:fields/src/domain/fields/logic/dynamic_field/dynamic_field.dart';
import 'package:fields/src/domain/fields/logic/field/field.dart';
import 'package:fields/src/domain/fields/logic/multi_selector_field/multi_selector_field.dart';
import 'package:fields/src/domain/fields/logic/screen_field/screen_field.dart';
import 'package:fields/src/domain/fields/logic/structure_field/structure_field.dart';
import 'package:fields/src/domain/fields/logic/structured_field/structured_field.dart';

extension IsSingleLineField on Field {
  bool get isSingleLine {
    if (this is MultiSelectorField) {
      return false;
    } else if (this is ScreenField) {
      return false;
    } else if (this is StructuredField) {
      return false;
    } else if (this is StructureField) {
      return false;
    } else if (this is DynamicField) {
      return false;
    }
    // TODO(alphamikle): [FIELDS] Add new fields here
    return true;
  }
}
