import 'package:cms/src/domain/admin_runner.dart';
import 'package:cms/src/service/config/admin_config.dart';
import 'package:cms/src/user_space/api/mock_entity_list_api.dart';
import 'package:cms/src/user_space/api/mock_entity_page_api.dart';
import 'package:cms/src/user_space/entity/bill_entity.dart';
import 'package:cms/src/user_space/entity/bill_tag_relations_entity.dart';
import 'package:cms/src/user_space/entity/currency_entity.dart';
import 'package:cms/src/user_space/entity/list_field_test_model.dart';
import 'package:cms/src/user_space/entity/tag_entity.dart';
import 'package:cms/src/user_space/entity/test_entity.dart';
import 'package:tools/tools.dart';

Future<void> main() async {
  final DbService dbService = createDbService();

  await adminRunner(
    models: [
      billEntity,
      currencyEntity,
      tagEntity,
      billTagRelationsEntity,
      testEntity,
      listFieldTestModel,
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
