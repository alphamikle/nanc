import 'package:fields/fields.dart';
import 'package:icons/icons.dart';
import 'package:model/model.dart';

final Model supaUserToNonFavoriteColors = Model(
  name: 'User ⤍ Non Favorite Colors',
  id: 'user_to_non_favorite_colors',
  icon: IconPackNames.mdi_relation_one_to_many,
  fields: [
    [
      IdField(),
      IdField(name: 'User ID', id: 'user_id'),
      IdField(name: 'Color ID', id: 'color_id'),
    ],
  ],
);
