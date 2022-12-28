import 'package:fields/fields.dart';
import 'package:model/model.dart';

const String parentEntityId = 'billId';
const String childEntityId = 'tagId';

final Model billTagRelationsEntity = Model(
  id: 'bill_tag_relation',
  name: 'Bill ↔ Tag',
  icon: 'tagCheck',
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
