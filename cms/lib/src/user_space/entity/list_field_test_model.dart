import 'package:fields/fields.dart';
import 'package:icons/icons.dart';
import 'package:model/model.dart';

final Model listFieldTestModel = Model(
  name: 'List field test model',
  icon: IconPackNames.flu_apps_list_detail_filled,
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
