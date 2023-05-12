import 'package:fields/fields.dart';
import 'package:icons/icons.dart';
import 'package:model/model.dart';

import 'demo_multi_selector_to_mock_data.dart';
import 'demo_multi_selector_to_user.dart';
import 'demo_user.dart';
import 'mock_data.dart';

final Model demoMultiSelector2 = Model(
  name: 'Multi Selector (2)',
  icon: IconPackNames.mdi_numeric_1,
  sort: 7,
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
    ],
    [
      MultiSelectorField(
        name: 'Mock Data',
        model: mockData,
        titleFields: const [
          ExternalField.id('first_name'),
          FieldsDivider.divider(' '),
          ExternalField.id('last_name'),
        ],
        thirdTable: ThirdTable(
          relationsEntity: demoMultiSelectorToMockData,
          childEntityIdName: 'mock_data_id',
          parentEntityIdName: 'multi_selector_id',
        ),
      ),
    ]
  ],
);
