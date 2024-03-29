import 'package:nanc_icons/nanc_icons.dart';

import '../../../../field/logic/fields/id_field/id_field.dart';
import 'model.dart';

Model genericRelationsModel({
  required String firstModelId,
  required String secondModelId,
  String? firstModelName,
  String? secondModelName,
  bool withPrimaryKey = true,
}) {
  final String firstName = firstModelName ?? firstModelId.toUpperCase();
  final String secondName = secondModelName ?? secondModelId.toUpperCase();

  return Model(
    name: '$firstName : $secondName relations',
    icon: IconPackNames.mdi_relation_many_to_many,
    fields: [
      [
        if (withPrimaryKey) IdField(),
        IdField(id: firstModelId, name: firstName),
        IdField(id: secondModelId, name: secondName),
      ],
    ],
  );
}
