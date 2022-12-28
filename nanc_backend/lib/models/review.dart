import 'package:fields/fields.dart';
import 'package:icons/icons.dart';
import 'package:model/model.dart';

final Model review = Model(
  name: 'Review',
  icon: IconPack.medalRibbonsStarBoldDuotone,
  fields: [
    [
      IdField(),
      StringField(name: 'Customer Name', maxLines: 1, isRequired: true),
      StringField(name: 'Customer Lastname', maxLines: 1, isRequired: true),
    ],
    [
      StringField(name: 'Customer Image', maxLines: 1),
      StringField(name: 'Position', maxLines: 1, isRequired: true),
    ],
    [
      StringField(name: 'Review', maxLines: 3, isRequired: true),
    ]
  ],
);
