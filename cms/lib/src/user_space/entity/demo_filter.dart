import 'package:fields/fields.dart';
import 'package:icons/icons.dart';
import 'package:model/model.dart';

final Model demoFilter = Model(
  name: 'Filter',
  icon: IconPackNames.mdi_numeric_3,
  sort: -8,
  fields: [
    [
      IdField(),
    ],
    [
      QueryFilterField(name: 'Collection filter', id: 'test_collection_filter_field'),
    ],
    [
      NumberField(name: 'Age'),
      DateTimeField(name: 'Birth Date'),
    ],
    [
      StringField(name: 'Name'),
      StringField(name: 'Lastname'),
    ],
    [
      BoolField(name: 'Has WA?'),
    ]
  ],
);
