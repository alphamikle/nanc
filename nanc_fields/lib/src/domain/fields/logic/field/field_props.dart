import '../bool_field/bool_field.dart';
import '../color_field/color_field.dart';
import '../icon_field/icon_field.dart';
import '../id_field/id_field.dart';
import '../models_selector_field/models_selector_field.dart';
import '../number_field/number_field.dart';
import '../string_field/string_field.dart';

const String fieldIdProperty = 'id';
const String fieldNameProperty = 'name';
const String fieldShowInListProperty = 'showInList';
const String fieldIsRequiredProperty = 'isRequired';
const String fieldSortProperty = 'sort';
const String fieldTypeProperty = 'type';
const String fieldValidatorProperty = 'validator';
const String fieldContentProperty = 'content';
const String fieldContentColorProperty = 'contentColor';
const String fieldContentIconProperty = 'contentIcon';
const String fieldIsScrollableProperty = 'isScrollable';
const String fieldModelProperty = 'model';
const String fieldTitleFieldsProperty = 'titleFields';
const String fieldStructureProperty = 'structure';
const String fieldThirdTableProperty = 'thirdTable';
const String fieldMaxLinesProperty = 'maxLines';
const String fieldDefaultValueProperty = 'defaultValue';
const String fieldVirtualFieldProperty = 'virtualField';
const String fieldValueProperty = 'value';

final StringField fieldToModelName = StringField(id: fieldNameProperty, name: 'Field name', isRequired: true, maxLines: 1);
final IdField fieldToModelId = IdField(id: fieldIdProperty, name: 'Field ID');
final StringField fieldToModelVirtualField = StringField(id: fieldVirtualFieldProperty, name: 'Virtual field');
final NumberField fieldToModelSort = NumberField(
  id: fieldSortProperty,
  name: 'Sort (in table view)',
  numberType: NumberType.smallInt,
  signType: SignType.unsigned,
);
final NumberField fieldToModelMaxLines = NumberField(id: fieldMaxLinesProperty, name: 'Maximum lines');
final BoolField fieldToModelShowInList = BoolField(id: fieldShowInListProperty, name: 'Show in table view?');
final BoolField fieldToModelIsRequired = BoolField(id: fieldIsRequiredProperty, name: 'Is field required?');
final BoolField fieldToModelDefaultValue = BoolField(id: fieldDefaultValueProperty, name: 'Default value');
final StringField fieldToModelValidator = StringField(id: fieldValidatorProperty, name: 'Validator');
final StringField fieldToModelContent = StringField(id: fieldContentProperty, name: 'Content', isRequired: true, maxLines: 1);
final ColorField fieldToModelContentColor = ColorField(id: fieldContentColorProperty, name: 'Color');
final IconField fieldToModelContentIcon = IconField(id: fieldContentIconProperty, name: 'Icon');
final ModelsSelectorField fieldToModelModel = ModelsSelectorField(id: fieldModelProperty, name: 'Model');
