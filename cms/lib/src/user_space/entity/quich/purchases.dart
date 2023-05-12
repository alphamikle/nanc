import 'package:fields/fields.dart';
import 'package:model/model.dart';

import 'bills.dart';
import 'categories.dart';

final Model quichPurchase = Model(
  name: 'Purchases',
  icon: 'flu_shopping_bag_filled',
  sort: 3,
  fields: [
    [
      IdField(),
    ],
    [
      StringField(name: 'Title', id: 'title', maxLines: 1, showInList: true),
      NumberField(name: 'Price', id: 'price', showInList: true),
      NumberField(name: 'Quantity', id: 'quantity', showInList: true),
    ],
    [
      NumberField(name: 'Rating', id: 'rating', showInList: true),
      NumberField(name: 'Discount', id: 'discount'),
      EnumField(
        name: 'Discount Type',
        id: 'discountType',
        values: const [
          EnumValue(title: 'Percent', value: 'percent'),
          EnumValue(title: 'Fixed', value: 'fixed'),
        ],
      ),
    ],
    [
      SelectorField(
        name: 'Category',
        id: 'categoryId',
        model: quichCategory,
        titleFields: const [ExternalField.id('title')],
      ),
      SelectorField(
        name: 'Bill',
        id: 'billId',
        model: quichBill,
        titleFields: const [ExternalField.id('id')],
      ),
    ],
    [
      StringField(name: 'Comment', id: 'comment'),
    ],
    [
      DateTimeField(name: 'Created At', id: 'createdAt', isCreatedAtField: true, showInList: true),
      DateTimeField(name: 'Updated At', id: 'updatedAt', isCreatedAtField: true, showInList: true),
      BoolField(name: 'Is Deleted', id: 'isDeleted', showInList: true),
    ],
  ],
);
