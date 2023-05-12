import 'package:fields/fields.dart';
import 'package:model/model.dart';

final Model mUser = Model(
  name: 'M.User',
  id: 'm_user_id_unique',
  icon: '',
  fields: [
    [
      IdField(),
    ],
    [
      StringField(name: 'Name', showInList: true),
      StringField(name: 'LastName', showInList: true),
    ],
    [
      NumberField(name: 'Age', showInList: true),
      EnumField(
        name: 'Sex',
        values: const [
          EnumValue(title: 'Male', value: 'male'),
          EnumValue(title: 'Female', value: 'female'),
          EnumValue(title: 'Other', value: 'other'),
        ],
      ),
    ]
  ],
);
