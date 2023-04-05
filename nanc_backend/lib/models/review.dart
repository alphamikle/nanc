import 'package:fields/fields.dart';
import 'package:icons/icons.dart';
import 'package:model/model.dart';
import 'position.dart';

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
      SelectorField(
        name: 'Position',
        id: 'position_new',
        model: position,
        titleFields: const [
          ExternalField('position'),
        ],
        structure: SelectorFieldStructure.object,
      ),
    ],
    [
      StringField(name: 'Review', isRequired: true),
    ]
  ],
);
