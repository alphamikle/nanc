import 'package:fields/fields.dart';
import 'package:model/model.dart';

final Model mProductToMCategory = Model(
  name: 'M.Product - M.Category',
  icon: '',
  id: 'm_product_to_m_category',
  fields: [
    [
      IdField(id: 'product_id'),
      IdField(id: 'category_id'),
    ]
  ],
);
