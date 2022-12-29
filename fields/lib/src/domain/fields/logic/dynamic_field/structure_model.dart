import 'dart:convert';

import 'package:config/config.dart';
import 'package:fields/src/domain/fields/logic/id_field/id_field.dart';
import 'package:fields/src/domain/fields/logic/string_field/string_field.dart';
import 'package:icons/icons.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';

const String _kStructureKey = 'structure:2a650905-5bb1-402c-a64b-5ac6f410283a';

const String kStructureIdField = 'id';
const String kStructureField = 'structure';

final Model structureModel = Model(
  name: 'Structure',
  icon: IconPack.ssdSquareLineDuotone,
  showInMenu: Env.isProduction == false,
  sort: 9999,
  fields: [
    [
      IdField(id: kStructureIdField, width: 250),
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

String generateStructureFieldId(String fieldId) => '$fieldId:$_kStructureKey';

String generateStructurePageId(String structureFieldId, String modelId) => '$modelId:$structureFieldId';

bool isStructureField(String fieldId) => fieldId.contains(_kStructureKey);
