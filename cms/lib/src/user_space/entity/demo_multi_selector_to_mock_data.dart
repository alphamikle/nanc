import 'package:fields/fields.dart';
import 'package:icons/icons.dart';
import 'package:model/model.dart';

final Model demoMultiSelectorToMockData = Model(
  name: 'Multi Selector to Mock Data',
  icon: IconPackNames.mdi_relation_many_to_many,
  sort: 8,
  fields: [
    [
      IdField(id: 'mock_data_id', name: 'Mock Data ID'),
      IdField(id: 'multi_selector_id', name: 'Multi Selector ID'),
    ]
  ],
);
