import 'package:config/config.dart';
import 'package:fields/fields.dart';
import 'package:icons/icons.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';

const String _kModelKey = 'model:5655186f-9213-4e21-9847-4f2c6db1a789';

const String kModelField = 'model';

final Model modelModel = Model(
  name: 'Model',
  icon: IconPack.codeLineDuotone,
  sort: 9998,
  showInMenu: Env.isProduction == false,
  fields: [
    [
      fieldToModelId,
    ],
    [
      StringField(id: kModelField, name: 'Model', maxLines: 15),
    ],
  ],
);

Future<Json> generateModelJson({
  required String id,
  required dynamic model,
}) async {
  return <String, dynamic>{
    fieldIdProperty: id,
    kModelField: model,
  };
}

String generateModelId(String modelId) => '$modelId:$_kModelKey';
