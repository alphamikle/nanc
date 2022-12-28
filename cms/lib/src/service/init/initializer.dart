import 'dart:async';

import 'package:cms/cms.dart';
import 'package:cms/src/domain/collection/logic/logic/bloc/collection_bloc.dart';
import 'package:cms/src/domain/collection/logic/logic/provider/page_list_provider.dart';
import 'package:cms/src/domain/draft/logic/draft_service.dart';
import 'package:cms/src/domain/general/logic/bloc/header/header_bloc.dart';
import 'package:cms/src/domain/general/logic/bloc/side_menu/menu_bloc.dart';
import 'package:cms/src/domain/model/logic/bloc/model_page_bloc/model_page_bloc.dart';
import 'package:cms/src/domain/model/logic/provider/entity_model_provider.dart';
import 'package:cms/src/domain/page/logic/provider/entity_page_provider.dart';
import 'package:cms/src/domain/preview/logic/bloc/preview_bloc.dart';
import 'package:cms/src/domain/tutorial/logic/bloc/tutorial_bloc.dart';
import 'package:cms/src/service/config/admin_config.dart';
import 'package:cms/src/service/errors/error_wrapper.dart';
import 'package:cms/src/service/routing/routes_preloading_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:model/model.dart';
import 'package:tools/tools.dart';

class Initializer {
  Initializer({
    required this.models,
    required this.pageListApi,
    required this.pageApi,
    required this.config,
    required this.rootKey,
    required this.errorStreamController,
    this.patternMap = const {},
  });

  final List<Model> models;
  final PageListApi pageListApi;
  final PageApi pageApi;
  final AdminConfig config;

  final RootKey rootKey;
  final PatternMap patternMap;
  final StreamController<ErrorWrapper> errorStreamController;
  final List<BlocProvider<dynamic>> blocProviders = [];
  final List<RepositoryProvider<dynamic>> repositoryProviders = [];

  Future<bool> init() async {
    /// ? SERVICES
    final EventBus eventBus = EventBus();
    final DbService dbService = DbService();
    final DraftService draftService = DraftService(dbService: dbService);

    /// ? PROVIDERS
    final PageProvider entityPageProvider = PageProvider(api: pageApi);
    final PageListProvider entityListProvider = PageListProvider(api: pageListApi);
    final ModelProvider entityModelProvider = ModelProvider(pageProvider: entityPageProvider, pageListProvider: entityListProvider);

    /// ? ENTITY WITH NAV
    final ModelListBloc entityModelListBloc = ModelListBloc(modelProvider: entityModelProvider);

    /// ? BLOCS
    final PreviewBloc previewBloc = PreviewBloc(eventBus: eventBus);
    final EditorBloc editorBloc = EditorBloc(eventBus: eventBus, patternMap: patternMap);
    final MenuBloc menuBloc = MenuBloc(entityModelListBloc: entityModelListBloc);
    final HeaderBloc headerBloc = HeaderBloc();
    final ModelPageBloc entityModelPageBloc =
        ModelPageBloc(modelListBloc: entityModelListBloc, rootKey: rootKey, modelProvider: entityModelProvider, menuBloc: menuBloc);
    final TutorialBloc tutorialBloc = TutorialBloc(dbService: dbService, rootKey: rootKey);

    final CollectionBloc entityListBloc = CollectionBloc(modelListBloc: entityModelListBloc, pageListProvider: entityListProvider, eventBus: eventBus);
    final BasePageBloc<BaseEntityPageState> entityPageBloc = PageBloc(
      modelListBloc: entityModelListBloc,
      pageProvider: entityPageProvider,
      eventBus: eventBus,
      draftService: draftService,
    );
    final RoutesPreloadingService routesPreloadingService = RoutesPreloadingService(rootKey: rootKey);

    /// ? PRE-INITIALIZATION
    unawaited(entityModelListBloc.loadDynamicModels(models));
    unawaited(headerBloc.initItems());

    blocProviders
      ..clear()
      ..addAll([
        BlocProvider<PreviewBloc>.value(value: previewBloc),
        BlocProvider<EditorBloc>.value(value: editorBloc),
        BlocProvider<MenuBloc>.value(value: menuBloc),
        BlocProvider<ModelListBloc>.value(value: entityModelListBloc),
        BlocProvider<CollectionBloc>.value(value: entityListBloc),
        BlocProvider<BasePageBloc<BaseEntityPageState>>.value(value: entityPageBloc),
        BlocProvider<ModelPageBloc>.value(value: entityModelPageBloc),
        BlocProvider<HeaderBloc>.value(value: headerBloc),
        BlocProvider<TutorialBloc>.value(value: tutorialBloc),
      ]);

    repositoryProviders
      ..clear()
      ..addAll([
        RepositoryProvider<RootKey>.value(value: rootKey),
        RepositoryProvider<EventBus>.value(value: eventBus),
        RepositoryProvider<ModelProvider>.value(value: entityModelProvider),
        RepositoryProvider<PageListProvider>.value(value: entityListProvider),
        RepositoryProvider<PageListProviderInterface>.value(value: entityListProvider),
        RepositoryProvider<PageProvider>.value(value: entityPageProvider),
        RepositoryProvider<PageProviderInterface>.value(value: entityPageProvider),
        RepositoryProvider<AdminConfig>.value(value: config),
        RepositoryProvider<RoutesPreloadingService>.value(value: routesPreloadingService),
        RepositoryProvider<DraftService>.value(value: draftService),
      ]);
    return true;
  }
}
