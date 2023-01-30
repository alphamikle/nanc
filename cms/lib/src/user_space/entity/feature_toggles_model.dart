import 'package:fields/fields.dart';
import 'package:icons/icons.dart';
import 'package:model/model.dart';

final Model featureTogglesModel = Model(
  name: 'Feature toggles',
  icon: IconPackNames.flu_toggle_multiple_filled,
  isCollection: false,
  fields: [
    [
      IdField(),
    ],
    [
      StringField(name: 'Actual version'),
      StringField(name: 'Last supported version'),
    ],
    [
      BoolField(name: 'Is <feature_1> enabled?'),
      BoolField(name: 'Is <feature_2> enabled?'),
      BoolField(name: 'Is <feature_3> enabled?'),
    ]
  ],
);
