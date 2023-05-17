import 'package:fields/fields.dart';
import 'package:model/model.dart';

final Model supaUser = Model(
  name: 'Users',
  id: 'users',
  icon: '',
  fields: [
    [
      IdField(),
    ],
    [
      StringField(name: 'Name', id: 'name', showInList: true, isRequired: true),
      StringField(name: 'Lastname', id: 'lastname', showInList: true, isRequired: true),
      NumberField(name: 'Age', id: 'age', showInList: true, isRequired: true),
    ],
  ],
);
