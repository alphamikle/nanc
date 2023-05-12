import 'package:fields/fields.dart';
import 'package:model/model.dart';

final Model mCategory = Model(
  name: 'M.Category',
  icon: '',
  fields: [
    [
      IdField(),
    ],
    [
      StringField(name: 'Title', showInList: true),
      ColorField(name: 'Color', showInList: true),
    ],
  ],
);
