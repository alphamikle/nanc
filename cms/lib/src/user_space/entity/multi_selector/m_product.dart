import 'package:fields/fields.dart';
import 'package:model/model.dart';
import 'package:nanc_config/nanc_config.dart';

import 'm_category.dart';
import 'm_product_to_m_category.dart';
import 'm_product_to_m_user.dart';
import 'm_user.dart';

final Model mProduct = Model(
  name: 'M.Product',
  icon: '',
  fields: [
    [
      IdField(),
    ],
    [
      StringField(name: 'Title', showInList: true),
      NumberField(name: 'Price', showInList: true),
    ],
    [
      MultiSelectorField(
        name: 'Categories',
        model: mCategory,
        titleFields: const [
          ExternalField.id('title'),
          ExternalField.id('color'),
        ],
        thirdTable: ThirdTable(
          parentEntityIdName: 'product_id',
          childEntityIdName: 'category_id',
          relationsEntity: mProductToMCategory,
        ),
      ),
      MultiSelectorField(
        name: 'Users',
        model: mUser,
        titleFields: const [
          ExternalField.id('name'),
          ExternalField.id('lastname'),
          FieldsDivider.divider(', '),
          ExternalField.id('age'),
        ],
        thirdTable: ThirdTable(
          parentEntityIdName: 'product_id',
          childEntityIdName: 'user_id',
          relationsEntity: mProductToMUser,
        ),
      ),
    ],
  ],
);
