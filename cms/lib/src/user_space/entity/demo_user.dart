import 'package:fields/fields.dart';
import 'package:icons/icons.dart';
import 'package:model/model.dart';

final Model demoUser = Model(
  name: 'User',
  icon: IconPackNames.rmx_user_3_fill,
  fields: [
    [
      IdField(),
    ],
    [
      StringField(name: 'Name', showInList: true, isRequired: true),
      StringField(name: 'Lastname', showInList: true, isRequired: true),
      NumberField(name: 'Age', showInList: true, isRequired: true),
    ]
  ],
);
