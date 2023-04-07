import 'package:fields/fields.dart';
import 'package:icons/icons.dart';
import 'package:model/model.dart';

import 'position.dart';

final Model developer = Model(
  name: 'Developer',
  icon: IconPackNames.mdi_code_greater_than_or_equal,
  fields: [
    [
      IdField(),
      StringField(name: 'Name', maxLines: 1, isRequired: true, width: 150),
      StringField(name: 'Second Name', maxLines: 1, isRequired: true, width: 180),
    ],
    [
      SelectorField(
        name: 'Position',
        id: 'position_new',
        model: position,
        titleFields: const [
          ExternalField('position'),
        ],
        isRequired: true,
      ),
      StringField(name: 'Image', maxLines: 1, isRequired: true),
    ],
    [
      StringField(name: 'Description', maxLines: 2, isRequired: true),
    ],
    [
      StringField(name: 'Facebook', maxLines: 1),
      StringField(name: 'Instagram', maxLines: 1),
    ],
    [
      StringField(name: 'Twitter', maxLines: 1),
      StringField(name: 'YouTube', maxLines: 1),
    ],
  ],
);
