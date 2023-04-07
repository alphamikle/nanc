import 'package:fields/fields.dart';
import 'package:icons/icons.dart';
import 'package:model/model.dart';

import 'user_model.dart';

final Model testModel = Model(
  name: 'Test model',
  icon: IconPackNames.mdi_test_tube,
  sort: 99,
  fields: [
    [
      IdField(id: 'id'),
      DateField(id: 'date', name: 'Date field'),
      ColorField(id: 'color', name: 'Color field'),
    ],
    [
      DateField(name: 'Created at', isCreatedAtField: true),
      DateField(name: 'Updated at', isUpdatedAtField: true),
    ],
    [
      ScreenField(name: 'Screen'),
    ],
    [
      StringField(id: 'single_line_string_field', name: 'Single line string field', maxLines: 1),
      NumberField(
        id: 'number_field',
        name: 'Number field',
      ),
      IconField(
        id: 'icon_field',
        name: 'Icon field',
      ),
    ],
    [
      EnumField(
        id: 'enum_field',
        name: 'Enum field',
        values: FieldType.values.map((FieldType type) => EnumValue(title: type.name, value: type.toString())).toList(),
        isRequired: true,
      ),
      SelectorField(
        id: 'selector_field',
        name: 'Selector field',
        model: userModel,
        titleFields: const [
          ExternalField('name'),
          ExternalField('lastname'),
        ],
        isRequired: true,
      ),
      MultiSelectorField(
        id: 'multi_selector_field',
        name: 'Multi selector field',
        model: userModel,
        titleFields: const [
          ExternalField('name'),
          FieldsDivider(': '),
          ExternalField('age'),
          FieldsDecorator(' y.o.'),
        ],
        structure: MultiSelectorFieldStructure.arrayOfIds,
        isRequired: true,
      ),
      BoolField(
        id: 'bool_field',
        name: 'Boolean field',
      ),
    ],
    [
      StringField(
        id: 'multi_line_string_field',
        name: 'Multi line string field',
      ),
    ],
    [
      DynamicField(
        id: 'dynamic_field',
        name: 'List field (SingleLineString)',
      ),
    ],
    [
      FontField(name: 'Font Field'),
    ],
  ],
);
