import 'package:fields/fields.dart';
import 'package:icons/icons.dart';
import 'package:model/model.dart';

final Model image = Model(
  name: 'Image',
  icon: IconPack.galleryWideLineDuotone,
  fields: [
    [
      IdField(),
      StringField(name: 'Title', maxLines: 1, isRequired: true),
    ],
    [
      StringField(name: 'Url', maxLines: 1, isRequired: true),
    ]
  ],
);
