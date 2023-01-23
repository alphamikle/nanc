import 'package:fields/fields.dart';
import 'package:icons/icons.dart';
import 'package:model/model.dart';

final Model bullet = Model(
  name: 'Bullet',
  icon: IconPackNames.flu_text_bullet_list_ltr_filled,
  fields: [
    [
      IdField(width: 300),
      StringField(name: 'Title', maxLines: 1, isRequired: true, width: 350),
    ],
    [
      StringField(name: 'Description', isRequired: true, showInList: true),
    ]
  ],
);
