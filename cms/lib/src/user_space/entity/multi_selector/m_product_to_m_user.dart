import 'package:fields/fields.dart';
import 'package:model/model.dart';

final Model mProductToMUser = Model(
  name: 'M.Product - M.User',
  icon: '',
  id: 'm_product_to_m_user',
  fields: [
    [
      IdField(id: 'product_id'),
      IdField(id: 'user_id'),
    ]
  ],
);
