import 'package:cms/src/domain/admin_runner.dart';
import 'package:cms/src/service/config/admin_config.dart';
import 'package:cms/src/user_space/api/mock_entity_list_api.dart';
import 'package:cms/src/user_space/api/mock_entity_page_api.dart';
import 'package:cms/src/user_space/entity/test_model.dart';
import 'package:cms/src/user_space/entity/user_model.dart';
import 'package:tools/tools.dart';

Future<void> main() async {
  final DbService dbService = createDbService();

  await adminRunner(
    models: [
      userModel,
      testModel,
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
