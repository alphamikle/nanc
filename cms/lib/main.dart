import 'package:nanc_api_supabase/nanc_api_supabase.dart';
import 'package:nanc_config/nanc_config.dart';
import 'package:tools/tools.dart';

import 'src/domain/admin_runner.dart';
import 'src/user_space/entity/supabase/supa_color.dart';
import 'src/user_space/entity/supabase/supa_user.dart';
import 'src/user_space/entity/supabase/supa_user_to_favorite_colors.dart';
import 'src/user_space/entity/supabase/supa_user_to_unfavorite_colors.dart';

Future<void> main() async {
  final DbService dbService = createDbService();
  final SupabaseApi supabaseApi = await SupabaseApi.create(
    supabaseKey: const String.fromEnvironment('SUPA_KEY'),
    supabaseUrl: const String.fromEnvironment('SUPA_URL'),
  );

  await adminRunner(
    CmsConfig(
      collectionApi: SupabaseCollectionApi(api: supabaseApi),
      pageApi: SupabasePageApi(api: supabaseApi),
      modelApi: SupabaseModelApi(
        api: supabaseApi,
        executorFunctionName: 'executor',
        executorFunctionQueryArgumentName: 'query',
        executorFunctionReturnableArgumentName: 'returnable',
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
        supaUser,
        supaColor,
        supaUserToFavoriteColors,
        supaUserToNonFavoriteColors,
      ],
      customRenderers: [],
      clickHandlers: [],
      customFonts: [],
    ),
  );
}
