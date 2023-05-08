import 'package:fields/fields.dart';
import 'package:model/model.dart';

final Model quichCurrency = Model(
  name: 'Currencies',
  id: 'currencies',
  icon: 'mdi_currency_usd',
  fields: [
    [
      IdField(),
    ],
    [
      StringField(name: 'Code', id: 'code', maxLines: 1, showInList: true),
      StringField(name: 'Title', id: 'code', maxLines: 1, showInList: true),
      StringField(name: 'Symbol', id: 'symbol', maxLines: 1, showInList: true),
    ],
    [
      StringField(name: 'Svg', id: 'svgImage'),
    ]
  ],
);
