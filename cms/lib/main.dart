import 'package:tools/tools.dart';

import 'src/domain/admin_runner.dart';
import 'src/service/config/admin_config.dart';
import 'src/user_space/api/mock_entity_list_api.dart';
import 'src/user_space/api/mock_entity_page_api.dart';
import 'src/user_space/entity/feature_toggles_model.dart';
import 'src/user_space/entity/model_with_enum_and_selectors.dart';
import 'src/user_space/entity/structure_field_example_model.dart';
import 'src/user_space/entity/test_model.dart';
import 'src/user_space/entity/user_model.dart';

Future<void> main() async {
  final DbService dbService = createDbService();

  await adminRunner(
    models: [
      userModel,
      testModel,
      featureTogglesModel,
      modelWithEnumAndSelectors,
      structureFieldExampleModel,
    ],
    pageListApi: MockEntityListApi(
      dbService: dbService,
    ),
    pageApi: MockEntityPageApi(
      dbService: dbService,
    ),
    config: const AdminConfig(
      pageNumberParameterName: 'page',
      limitPerPageParameterName: 'limit',
    ),
  );
}
