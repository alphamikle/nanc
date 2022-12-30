import 'package:fields/fields.dart';
import 'package:icons/icons.dart';
import 'package:model/model.dart';

final Model feature = Model(
  name: 'Feature',
  icon: IconPackNames.flu_ribbon_star_filled,
  fields: [
    [
      IdField(),
      StringField(name: 'Title', maxLines: 1, isRequired: true),
    ],
    [
      IconField(name: 'Image', isRequired: true),
    ],
    [
      StringField(name: 'Description', isRequired: true),
    ],
  ],
);
