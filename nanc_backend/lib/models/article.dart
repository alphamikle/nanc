import 'package:fields/fields.dart';
import 'package:icons/icons.dart';
import 'package:model/model.dart';

final Model article = Model(
  name: 'Article',
  icon: IconPackNames.flu_attach_text_regular,
  fields: [
    [
      IdField(),
      StringField(name: 'Title', maxLines: 1, isRequired: true),
    ],
    [
      StringField(name: 'Url', maxLines: 1, isRequired: true),
      StringField(name: 'Image', maxLines: 1, isRequired: true),
    ],
    [
      StringField(name: 'Description', maxLines: 2, isRequired: true),
    ],
  ],
);
