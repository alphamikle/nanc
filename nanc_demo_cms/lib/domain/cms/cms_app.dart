import 'package:cms/cms.dart';
import 'package:nanc_api_supabase/nanc_api_supabase.dart';
import 'package:nanc_config/nanc_config.dart';

import '../models/supabase/supa_color.dart';
import '../models/supabase/supa_user.dart';
import '../models/supabase/supa_user_to_favorite_colors.dart';
import '../models/supabase/supa_user_to_unfavorite_colors.dart';

Future<void> startCmsApp() async {
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
        config: const SupabaseModelApiConfig(
          executorFunctionName: 'executor',
          executorSqlArgumentName: 'query',
          executorReturnableArgumentName: 'returnable',
          changeDifferentTypes: true,
          deleteUnnecessaryColumns: true,
        ),
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
