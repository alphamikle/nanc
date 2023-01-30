import 'package:fields/fields.dart';
import 'package:icons/icons.dart';
import 'package:model/model.dart';

final Model modelWithEnumAndSelectorsToUsersRelations = Model(
  name: 'E.S. to Users',
  icon: IconPackNames.mdi_relation_many_to_one,
  fields: [
    [
      IdField(id: 'model_with_enum_and_selectors_id', name: 'E.S. ID'),
      IdField(id: 'user_id', name: 'User ID'),
    ]
  ],
);
