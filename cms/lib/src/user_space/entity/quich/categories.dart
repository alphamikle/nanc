import 'package:fields/fields.dart';
import 'package:model/model.dart';

import 'users.dart';

final Model quichCategory = Model(
  name: 'Categories',
  icon: 'flu_box_multiple_search_regular',
  fields: [
    [
      IdField(),
    ],
    [
      StringField(name: 'Title', id: 'title', maxLines: 1, showInList: true),
    ],
    [
      NumberField(name: 'Color', id: 'color', showInList: true),
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
        name: 'Parent Category',
        id: 'parentId',
        model: _parentCategory,
        titleFields: const [ExternalField.id('title')],
      ),
    ],
    [
      DateTimeField(name: 'Created At', id: 'createdAt', isCreatedAtField: true, showInList: true),
      DateTimeField(name: 'Updated At', id: 'updatedAt', isCreatedAtField: true, showInList: true),
      BoolField(name: 'Is Deleted', id: 'isDeleted', showInList: true),
    ],
  ],
);

final Model _parentCategory = Model(
  name: 'Categories',
  icon: 'flu_box_multiple_search_regular',
  fields: [
    [
      IdField(),
    ],
    [
      StringField(name: 'Title', id: 'title', maxLines: 1),
    ],
    [
      NumberField(name: 'Color', id: 'color'),
      StringField(name: 'User', id: 'userId', maxLines: 1),
      StringField(name: 'Parent Category', id: 'parentId', maxLines: 1),
    ],
    [
      DateTimeField(name: 'Created At', id: 'createdAt', isCreatedAtField: true),
      DateTimeField(name: 'Updated At', id: 'updatedAt', isCreatedAtField: true),
      BoolField(name: 'Is Deleted', id: 'isDeleted'),
    ],
  ],
);
