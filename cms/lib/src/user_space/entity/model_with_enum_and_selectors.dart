import 'package:fields/fields.dart';
import 'package:icons/icons.dart';
import 'package:model/model.dart';

import 'user_model.dart';

final Model modelWithEnumAndSelectors = Model(
  name: 'Model with Enum and Selectors',
  icon: IconPackNames.mdi_image_broken_variant,
  isCollection: false,
  fields: [
    [
      IdField(),
    ],
    [
      ScreenField(name: 'Data structure tester'),
    ],
    [
      MultiSelectorField(
        name: 'Related users',
        model: userModel,
        titleFields: const [
          ExternalField('name'),
          ExternalField('lastname'),
        ],
        structure: MultiSelectorFieldStructure.arrayOfObjects,
      ),
    ]
  ],
);
