import 'package:cms/src/user_space/entity/bill_tag_relations_entity.dart';
import 'package:cms/src/user_space/entity/currency_entity.dart';
import 'package:cms/src/user_space/entity/tag_entity.dart';
import 'package:fields/fields.dart';
import 'package:icons/icons.dart';
import 'package:model/model.dart';

final Model billEntity = Model(
  name: 'Bills',
  icon: IconPackNames.mdi_receipt_text_outline,
  fields: [
    [
      IdField(),
      NumberField(
        id: 'totalSum',
        name: 'Total sum',
        validator: (Object? value) {
          final double? doubleValue = double.tryParse(value.toString());
          if (doubleValue == null) {
            return 'Number is not specified!';
          }
          if (doubleValue < 15) {
            return 'Number value is less than 15';
          }
          return null;
        },
      ),
      NumberField(id: 'mainTotalSum', name: 'Main total sum', isRequired: true),
    ],
    [
      DateField(id: 'billDate', name: 'Bill date'),
    ],
    [
      DateField(id: 'createdAt', name: 'Created at', showInList: false, isRequired: true),
      DateField(id: 'updatedAt', name: 'Updated at', showInList: false, isRequired: true),
      BoolField(id: 'isDeleted', name: 'Is deleted', showInList: false, isRequired: true),
    ],
    [
      SelectorField(
        id: 'currencyId',
        name: 'Currency',
        model: currencyEntity,
        titleFields: const ['title'],
        structure: SelectorFieldStructure.id,
        showInList: false,
      ),
      StringField(id: 'purseId', name: 'Purse', showInList: false, isRequired: true, maxLines: 1),
      MultiSelectorField(
        id: 'tags',
        name: 'Tags',
        model: tagEntity,
        thirdTable: ThirdTable(
          relationsEntity: billTagRelationsEntity,
          parentEntityIdName: parentEntityId,
          childEntityIdName: childEntityId,
        ),
        titleField: 'title',
        structure: MultiSelectorFieldStructure.thirdTable,
      ),
    ],
    [
      StringField(sort: 1, id: 'comment', name: 'Comment'),
    ],
  ],
);
