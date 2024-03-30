import 'package:nanc_icons/nanc_icons.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../../../../field/logic/fields/field/field_props.dart';
import '../../../../field/logic/fields/string_field/string_field.dart';
import 'model.dart';

const String _kModelKey = 'model:5655186f-9213-4e21-9847-4f2c6db1a789';

const String kModelField = 'model';

final Model modelModel = Model(
  name: 'Model',
  icon: IconPackNames.mdi_file_code,
  sort: 9998,
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
