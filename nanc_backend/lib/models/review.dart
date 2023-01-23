import 'package:fields/fields.dart';
import 'package:icons/icons.dart';
import 'package:model/model.dart';

final Model review = Model(
  name: 'Review',
  icon: IconPackNames.flu_star_edit_regular,
  fields: [
    [
      IdField(),
      StringField(name: 'Name', id: 'customer_name', maxLines: 1, isRequired: true, width: 200),
      StringField(name: 'Lastname', id: 'customer_lastname', maxLines: 1, isRequired: true, width: 200),
    ],
    [
      StringField(name: 'Image', maxLines: 1),
      StringField(name: 'Position', maxLines: 1, isRequired: true, showInList: true),
    ],
    [
      StringField(name: 'Review', isRequired: true),
    ]
  ],
);
