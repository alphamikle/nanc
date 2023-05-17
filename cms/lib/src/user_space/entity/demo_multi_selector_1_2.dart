import 'package:fields/fields.dart';
import 'package:icons/icons.dart';
import 'package:model/model.dart';
import 'package:nanc_config/nanc_config.dart';

import 'demo_multi_selector_to_mock_data.dart';
import 'mock_data.dart';

final Model demoMultiSelector12 = Model(
  name: 'Multi Selector (1-2)',
  icon: IconPackNames.mdi_numeric_1,
  sort: 7,
  fields: [
    [
      IdField(),
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
    ],
  ],
);
