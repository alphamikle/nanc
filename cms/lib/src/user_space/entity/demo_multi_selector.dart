import 'package:fields/fields.dart';
import 'package:icons/icons.dart';
import 'package:model/model.dart';

import 'demo_multi_selector_to_user.dart';
import 'demo_user.dart';

final Model demoMultiSelector = Model(
  name: 'Multi Selector',
  icon: IconPackNames.mdi_numeric_1,
  sort: -10,
  fields: [
    [
      IdField(),
    ],
    [
      MultiSelectorField(
        name: 'Users',
        model: demoUser,
        showInList: true,
        titleFields: const [
          ExternalField.id('name'),
          FieldsDivider.divider(' '),
          ExternalField.id('lastname'),
          FieldsDivider.divider(', '),
          ExternalField.id('age'),
          FieldsDecorator.decorator(' y.o.'),
        ],
        thirdTable: ThirdTable(
          relationsEntity: demoMultiSelectorToUser,
          childEntityIdName: 'user_id',
          parentEntityIdName: 'multi_selector_id',
        ),
      ),
    ]
  ],
);
