import 'package:fields/fields.dart';
import 'package:icons/icons.dart';

import '../../../../model.dart';

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
