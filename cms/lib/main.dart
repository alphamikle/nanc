import 'package:nanc_config/nanc_config.dart';
import 'package:tools/tools.dart';

import 'src/domain/admin_runner.dart';
import 'src/user_space/api/mock_entity_list_api.dart';
import 'src/user_space/api/mock_entity_page_api.dart';
import 'src/user_space/entity/quich/bills.dart';
import 'src/user_space/entity/quich/categories.dart';
import 'src/user_space/entity/quich/currencies.dart';
import 'src/user_space/entity/quich/purchases.dart';
import 'src/user_space/entity/quich/purses.dart';
import 'src/user_space/entity/quich/users.dart';

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
      networkConfig: NetworkConfig(
        paginationPageNumberParameterName: 'page',
        paginationLimitParameterName: 'limit',
        paginationDataContainerParameterName: 'data',
        paginationTotalPagesParameterName: 'total_pages',
        paginationLimitParameterDefaultValue: 100,
      ),
      imageBuilderDelegate: null,
      adminWrapperBuilder: null,
      predefinedModels: [
        quichBill,
        quichCategory,
        quichCurrency,
        quichPurchase,
        quichPurse,
        quichUser,
      ],
      customRenderers: [],
      clickHandlers: [],
      customFonts: [],
    ),
  );
}
