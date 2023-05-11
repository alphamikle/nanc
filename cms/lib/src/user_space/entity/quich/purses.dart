import 'package:fields/fields.dart';
import 'package:model/model.dart';

import 'currencies.dart';
import 'users.dart';

final Model quichPurse = Model(
  name: 'Purses',
  id: 'purses',
  icon: 'mdi_purse',
  fields: [
    [
      IdField(),
    ],
    [
      StringField(name: 'Title', id: 'title', maxLines: 1, showInList: true),
      SelectorField(
        name: 'User',
        id: 'userId',
        model: quichUser,
        titleFields: const [
          ExternalField.id('name'),
          FieldsDivider.divider(' '),
          ExternalField.id('lastname'),
        ],
      ),
      SelectorField(
        name: 'Currency',
        id: 'currencyId',
        model: quichCurrency,
        titleFields: const [ExternalField.id('Title')],
      ),
    ],
    [
      NumberField(name: 'Total Sum', id: 'totalSum', showInList: true),
      NumberField(name: 'Total Sum (Main Currency)', id: 'mainTotalSum'),
      EnumField(
        name: 'Type',
        id: 'type',
        values: const [
          EnumValue(title: 'Deposit', value: 'deposit'),
          EnumValue(title: 'Cash', value: 'cash'),
          EnumValue(title: 'Debit Card', value: 'debitCard'),
          EnumValue(title: 'Credit Card', value: 'creditCard'),
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
