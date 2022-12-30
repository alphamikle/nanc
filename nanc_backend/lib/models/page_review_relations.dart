import 'package:fields/fields.dart';
import 'package:icons/icons.dart';
import 'package:model/model.dart';

final Model pageReviewRelations = Model(
  name: 'Page-Review Relations',
  icon: IconPackNames.mdi_relation_one_to_many,
  fields: [
    [
      IdField(name: 'Review ID', id: 'review_id'),
      IdField(name: 'Page ID', id: 'page_id'),
    ],
  ],
);
