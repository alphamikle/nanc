import 'dart:convert';

import 'package:icons/icons.dart';
import 'package:tools/tools.dart';

import '../../../../model/logic/model/logic/model.dart';
import '../id_field/id_field.dart';
import '../string_field/string_field.dart';

const String kStructureKey = 'structure:2a650905-5bb1-402c-a64b-5ac6f410283a';

const String kStructureIdField = 'id';
const String kStructureField = 'structure';

final Model structureModel = Model(
  name: 'Structure',
  icon: IconPackNames.flu_broad_activity_feed_regular,
  sort: 9999,
  fields: [
    [
      IdField(id: kStructureIdField),
    ],
    [
      StringField(id: kStructureField, name: 'Structure', maxLines: 15),
    ]
  ],
);

Future<Json> generateStructureJson({
  required String id,
  required dynamic structure,
}) async {
  return <String, dynamic>{
    kStructureIdField: id,
    kStructureField: await encrypt(jsonEncode(structure)),
  };
}

String generateStructureFieldId(String fieldId) => '$fieldId:$kStructureKey';

String generateStructurePageId(String structureFieldId, String modelId) => '$modelId:$structureFieldId';

bool isStructureField(String fieldId) => fieldId.contains(kStructureKey);
