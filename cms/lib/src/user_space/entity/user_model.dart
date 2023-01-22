import 'package:fields/fields.dart';
import 'package:model/model.dart';

final Model userModel = Model(
  name: 'User',
  icon: 'rmx_user_3_fill',
  fields: [
    [
      IdField(width: 350),
    ],
    [
      StringField(name: 'Name', isRequired: true, maxLines: 1, width: 200),
      StringField(name: 'Lastname', isRequired: true, maxLines: 1, width: 200),
    ],
    [
      NumberField(name: 'Age', isRequired: true, showInList: true),
    ]
  ],
);
