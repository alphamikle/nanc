import 'package:fields/fields.dart';
import 'package:icons/icons.dart';
import 'package:model/model.dart';

const String parentEntityId = 'billId';
const String childEntityId = 'tagId';

final Model billTagRelationsEntity = Model(
  id: 'bill_tag_relation',
  name: 'Bill-Tag Relations',
  icon: IconPackNames.mdi_relation_one_to_many,
  sort: 3,
  fields: [
    [
      IdField(id: 'id'),
      IdField(id: parentEntityId, name: 'Bill ID'),
      IdField(id: childEntityId, name: 'Tag ID'),
    ],
    [
      DateField(id: 'createdAt', name: 'Created at'),
      DateField(id: 'updatedAt', name: 'Updated at'),
    ]
  ],
);
