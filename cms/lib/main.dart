import 'package:nanc_config/nanc_config.dart';
import 'package:tools/tools.dart';

import 'src/domain/admin_runner.dart';
import 'src/user_space/api/mock_entity_list_api.dart';
import 'src/user_space/api/mock_entity_page_api.dart';
import 'src/user_space/entity/demo_filter.dart';
import 'src/user_space/entity/demo_multi_selector_1_1.dart';
import 'src/user_space/entity/demo_multi_selector_1_2.dart';
import 'src/user_space/entity/demo_multi_selector_2.dart';
import 'src/user_space/entity/demo_multi_selector_to_mock_data.dart';
import 'src/user_space/entity/demo_multi_selector_to_user.dart';
import 'src/user_space/entity/demo_structured.dart';
import 'src/user_space/entity/demo_user.dart';
import 'src/user_space/entity/mock_data.dart';
import 'src/user_space/entity/multi_selector/m_category.dart';
import 'src/user_space/entity/multi_selector/m_product.dart';
import 'src/user_space/entity/multi_selector/m_product_to_m_category.dart';
import 'src/user_space/entity/multi_selector/m_product_to_m_user.dart';
import 'src/user_space/entity/multi_selector/m_user.dart';
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

        /// ? Test models
        demoFilter,
        demoMultiSelector11,
        demoMultiSelector12,
        demoMultiSelector2,
        demoStructured,
        demoUser,
        mockData,
        demoMultiSelectorToUser,
        demoMultiSelectorToMockData,

        /// ? Experiments with multi-selector
        mCategory,
        mProduct,
        mUser,
        mProductToMCategory,
        mProductToMUser,
      ],
      customRenderers: [],
      clickHandlers: [],
      customFonts: [],
    ),
  );
}
