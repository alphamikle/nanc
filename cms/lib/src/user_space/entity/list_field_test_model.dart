import 'package:fields/fields.dart';
import 'package:icons/icons.dart';
import 'package:model/model.dart';

final Model listFieldTestModel = Model(
  name: 'List field test model',
  icon: IconPackNames.box_test_tube,
  sort: -1,
  fields: [
    [
      IdField(id: 'id'),
    ],
    [
      DynamicField(id: 'list_1', name: 'LIST 1'),
    ]
  ],
);
