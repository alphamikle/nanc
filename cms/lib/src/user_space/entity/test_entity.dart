import 'package:cms/src/user_space/entity/currency_entity.dart';
import 'package:cms/src/user_space/entity/tag_entity.dart';
import 'package:fields/fields.dart';
import 'package:model/model.dart';

final Model testEntity = Model(
  name: 'Test model',
  icon: 'testTube',
  sort: 99,
  fields: [
    [
      IdField(id: 'id'),
      DateField(id: 'date', name: 'Date field'),
      ColorField(id: 'color', name: 'Color field'),
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
        model: tagEntity,
        titleField: 'title',
        structure: SelectorFieldStructure.id,
        isRequired: true,
      ),
      MultiSelectorField(
        id: 'multi_selector_field',
        name: 'Multi selector field',
        model: currencyEntity,
        titleField: 'title',
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
    ]
  ],
);
