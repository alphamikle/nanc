import 'package:fields/fields.dart';
import 'package:model/model.dart';

final Model quichUser = Model(
  name: 'Users',
  icon: 'rmx_user_3_line',
  fields: [
    [
      IdField(),
    ],
    [
      StringField(name: 'Email', id: 'email', showInList: true, sort: 2),
      StringField(name: 'Phone', id: 'phone', showInList: true, sort: 3),
    ],
    [
      StringField(name: 'Name', id: 'name', showInList: true, sort: 0),
      StringField(name: 'Lastname', id: 'lastname', showInList: true, sort: 1),
    ],
    [
      DateTimeField(name: 'Created At', id: 'createdAt', isCreatedAtField: true, showInList: true, sort: 4),
      DateTimeField(name: 'Updated At', id: 'updatedAt', isCreatedAtField: true, showInList: true, sort: 5),
    ],
  ],
);
