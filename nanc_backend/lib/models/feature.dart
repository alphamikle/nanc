import 'package:fields/fields.dart';
import 'package:icons/icons.dart';
import 'package:model/model.dart';

final Model feature = Model(
  name: 'Feature',
  icon: IconPack.starRainbowBoldDuotone,
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
