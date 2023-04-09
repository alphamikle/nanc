import 'package:fields/fields.dart';
import 'package:icons/icons.dart';
import 'package:model/model.dart';

final Model demoMultiSelectorToUser = Model(
  name: 'Multi Selector to User',
  icon: IconPackNames.mdi_relation_many_to_many,
  fields: [
    [
      IdField(id: 'user_id', name: 'User ID'),
      IdField(id: 'multi_selector_id', name: 'Multi Selector ID'),
    ]
  ],
);
