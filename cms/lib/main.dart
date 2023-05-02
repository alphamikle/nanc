import 'package:nanc_config/nanc_config.dart';
import 'package:tools/tools.dart';

import 'src/domain/admin_runner.dart';
import 'src/user_space/api/mock_entity_list_api.dart';
import 'src/user_space/api/mock_entity_page_api.dart';
import 'src/user_space/entity/demo_multi_selector.dart';
import 'src/user_space/entity/demo_multi_selector_to_user.dart';
import 'src/user_space/entity/demo_structured.dart';
import 'src/user_space/entity/demo_user.dart';
import 'src/user_space/entity/mock_data.dart';

Future<void> main() async {
  final DbService dbService = createDbService();

  await adminRunner(
    CmsConfig(
      collectionApi: MockEntityListApi(
        dbService: dbService,
      ),
      pageApi: MockEntityPageApi(
        dbService: dbService,
      ),
      networkConfig: const NetworkConfig(
        paginationPageNumberParameterName: 'page',
        paginationLimitParameterName: 'limit',
      ),
      imageBuilderDelegate: null,
      adminWrapperBuilder: null,
      predefinedModels: [
        demoUser,
        demoMultiSelector,
        demoMultiSelectorToUser,
        demoStructured,
        mockData,
      ],
      customRenderers: [],
      clickHandlers: [],
      customFonts: [],
    ),
  );
}
