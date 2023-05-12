import 'package:fields/fields.dart';
import 'package:icons/icons.dart';
import 'package:model/model.dart';

final Model mockData = Model(
  id: 'mock_data',
  name: 'Mock Data',
  icon: IconPackNames.flu_box_multiple_search_regular,
  sort: 12,
  fields: [
    [
      IdField(),
    ],
    [
      StringField(id: 'first_name', name: 'First Name', isRequired: true, showInList: true),
      StringField(id: 'last_name', name: 'Last Name', isRequired: true, showInList: true),
      StringField(id: 'email', name: 'Email', isRequired: true, showInList: true),
    ],
    [
      EnumField(
        id: 'gender',
        name: 'Gender',
        isRequired: true,
        showInList: true,
        values: const [
          EnumValue(title: 'Male', value: 'Male'),
          EnumValue(title: 'Female', value: 'Female'),
          EnumValue(title: 'Other', value: 'Other'),
        ],
      ),
      StringField(id: 'ip_address', name: 'IP Address', isRequired: true, showInList: true),
    ]
  ],
);
