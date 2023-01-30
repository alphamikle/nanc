import 'package:fields/fields.dart';
import 'package:model/model.dart';

final Model position = Model(
  name: 'Position',
  icon: 'flu_person_note_filled',
  fields: [
    [
      IdField(),
    ],
    [
      StringField(name: 'Position', isRequired: true, showInList: true, maxLines: 1),
    ]
  ],
);
