import 'package:fields/fields.dart';
import 'package:model/model.dart';

final Model currencyEntity = Model(
  name: 'Currencies',
  icon: 'currencyUsd',
  sort: 2,
  fields: [
    [
      IdField(id: 'id'),
      StringField(id: 'code', name: 'Currency code', maxLines: 1),
      StringField(id: 'title', name: 'Currency name', maxLines: 1),
    ],
    [
      StringField(id: 'svgImage', name: 'SVG Code', isRequired: true, showInList: false),
    ]
  ],
);
