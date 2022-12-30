import 'package:fields/fields.dart';
import 'package:icons/icons.dart';
import 'package:model/model.dart';

final Model tagEntity = Model(
  name: 'Tags',
  icon: IconPackNames.flu_tag_filled,
  sort: 1,
  fields: [
    [
      IdField(id: 'id'),
      StringField(id: 'title', name: 'Title', sort: 1, maxLines: 1),
    ],
    [
      DateField(id: 'createdAt', name: 'Created at', sort: 4),
      DateField(id: 'updatedAt', name: 'Updated at', sort: 3),
    ],
    [
      // TODO(alphamikle): Make it like color field
      NumberField(id: 'color', name: 'Color', sort: 2),
      StringField(id: 'userId', name: 'User Id', showInList: false, maxLines: 1),
    ],
  ],
);
