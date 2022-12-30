import 'package:fields/fields.dart';
import 'package:icons/icons.dart';
import 'package:model/model.dart';

final Model bullet = Model(
  name: 'Bullet',
  icon: IconPackNames.flu_text_bullet_list_ltr_filled,
  fields: [
    [
      IdField(),
      StringField(name: 'Title', maxLines: 1, isRequired: true),
    ],
    [
      StringField(name: 'Description', isRequired: true),
    ]
  ],
);
