import 'package:cms/cms.dart';
import 'package:nanc_api_firebase/nanc_api_firebase.dart';
import 'package:nanc_api_supabase/nanc_api_supabase.dart';
import 'package:nanc_config/nanc_config.dart';

import '../models/supabase/supa_color.dart';
import '../models/supabase/supa_user.dart';
import '../models/supabase/supa_user_to_favorite_colors.dart';
import '../models/supabase/supa_user_to_unfavorite_colors.dart';

enum DataProvider {
  supabase,
  firebase;

  bool get isSupabase => this == DataProvider.supabase;
  bool get isFirebase => this == DataProvider.firebase;
}

Future<void> startCmsApp(DataProvider provider) async {
  late final ICollectionApi collectionApi;
  late final IPageApi pageApi;
  late final IModelApi modelApi;

  if (provider.isSupabase) {
    final SupabaseApi supabaseApi = await SupabaseApi.create(
      supabaseKey: const String.fromEnvironment('SUPA_KEY'),
      supabaseUrl: const String.fromEnvironment('SUPA_URL'),
    );
    collectionApi = SupabaseCollectionApi(api: supabaseApi);
    pageApi = SupabasePageApi(api: supabaseApi);
    modelApi = SupabaseModelApi(
      api: supabaseApi,
      config: const SupabaseModelApiConfig(
        executorFunctionName: 'executor',
        executorSqlArgumentName: 'query',
        executorReturnableArgumentName: 'returnable',
        changeDifferentTypes: true,
        deleteUnnecessaryColumns: true,
      ),
    );
  } else if (provider.isFirebase) {
    final FirebaseApi firebaseApi = await FirebaseApi.create(const String.fromEnvironment('FIREBASE_JSON_BASE64_KEY'));
    collectionApi = FirebaseCollectionApi(
      api: firebaseApi,
    );
    pageApi = FirebasePageApi();
    modelApi = FirebaseModelApi();
  }

  await adminRunner(
    CmsConfig(
      collectionApi: collectionApi,
      pageApi: pageApi,
      modelApi: modelApi,
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
