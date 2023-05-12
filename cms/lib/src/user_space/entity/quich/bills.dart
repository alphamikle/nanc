import 'package:fields/fields.dart';
import 'package:model/model.dart';

import 'currencies.dart';
import 'purses.dart';

final Model quichBill = Model(
  name: 'Bills',
  id: 'bills',
  icon: 'flu_ticket_diagonal_regular',
  sort: 0,
  fields: [
    [
      IdField(),
    ],
    [
      StringField(name: 'Comment', id: 'comment', showInList: true),
    ],
    [
      NumberField(name: 'Total Sum', id: 'totalSum', showInList: true),
      NumberField(name: 'Total Sum (Main Currency)', id: 'mainTotalSum'),
    ],
    [
      DateTimeField(name: 'Bill Date', id: 'billDate', showInList: true),
    ],
    [
      SelectorField(
        name: 'Currency',
        id: 'currencyId',
        model: quichCurrency,
        titleFields: const [ExternalField.id('title')],
      ),
      SelectorField(
        name: 'Purse',
        id: 'purseId',
        model: quichPurse,
        titleFields: const [
          ExternalField.id('title'),
          FieldsDivider.divider(': '),
          ExternalField.id('type'),
        ],
      ),
    ],
    [
      DateTimeField(name: 'Created At', id: 'createdAt', isCreatedAtField: true, showInList: true),
      DateTimeField(name: 'Updated At', id: 'updatedAt', isCreatedAtField: true, showInList: true),
      BoolField(name: 'Is Deleted', id: 'isDeleted', showInList: true),
    ],
  ],
);
