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
    final PageProvider pageProvider = PageProvider(api: pageApi);
    final PageListProvider pageListProvider = PageListProvider(api: pageListApi);
    final ModelProvider modelProvider = ModelProvider(pageProvider: pageProvider, pageListProvider: pageListProvider);

    /// ? ENTITY WITH NAV
    final ModelListBloc modelListProvider = ModelListBloc(modelProvider: modelProvider);

    /// ? BLOCS
    final PreviewBloc previewBloc = PreviewBloc(eventBus: eventBus);
    final EditorBloc editorBloc = EditorBloc(eventBus: eventBus, patternMap: patternMap);
    final MenuBloc menuBloc = MenuBloc(modelListBloc: modelListProvider);
    final HeaderBloc headerBloc = HeaderBloc();
    final ModelPageBloc modelPageBloc = ModelPageBloc(
      modelListBloc: modelListProvider,
      rootKey: rootKey,
      modelProvider: modelProvider,
      menuBloc: menuBloc,
    );
    final TutorialBloc tutorialBloc = TutorialBloc(dbService: dbService, rootKey: rootKey);

    final CollectionBloc collectionBloc = CollectionBloc(modelListBloc: modelListProvider, pageListProvider: pageListProvider, eventBus: eventBus);
    final BasePageBloc<BaseEntityPageState> pageBloc = PageBloc(
      modelListBloc: modelListProvider,
      pageProvider: pageProvider,
      eventBus: eventBus,
      draftService: draftService,
    );
    final RoutesPreloadingService routesPreloadingService = RoutesPreloadingService(
      collectionBloc: collectionBloc,
      headerBloc: headerBloc,
      menuBloc: menuBloc,
      modelPageBloc: modelPageBloc,
      pageBloc: pageBloc as PageBloc,
      rootKey: rootKey,
    );

    /// ? PRE-INITIALIZATION
    await modelListProvider.preloadModelsFromCode(models);
    unawaited(modelListProvider.loadDynamicModels(models));
    unawaited(headerBloc.initItems());

    blocProviders
      ..clear()
      ..addAll([
        BlocProvider<PreviewBloc>.value(value: previewBloc),
        BlocProvider<EditorBloc>.value(value: editorBloc),
        BlocProvider<MenuBloc>.value(value: menuBloc),
        BlocProvider<ModelListBloc>.value(value: modelListProvider),
        BlocProvider<CollectionBloc>.value(value: collectionBloc),
        BlocProvider<BasePageBloc<BaseEntityPageState>>.value(value: pageBloc),
        BlocProvider<ModelPageBloc>.value(value: modelPageBloc),
        BlocProvider<HeaderBloc>.value(value: headerBloc),
        BlocProvider<TutorialBloc>.value(value: tutorialBloc),
      ]);

    repositoryProviders
      ..clear()
      ..addAll([
        RepositoryProvider<RootKey>.value(value: rootKey),
        RepositoryProvider<EventBus>.value(value: eventBus),
        RepositoryProvider<ModelProvider>.value(value: modelProvider),
        RepositoryProvider<PageListProvider>.value(value: pageListProvider),
        RepositoryProvider<PageListProviderInterface>.value(value: pageListProvider),
        RepositoryProvider<PageProvider>.value(value: pageProvider),
        RepositoryProvider<PageProviderInterface>.value(value: pageProvider),
        RepositoryProvider<AdminConfig>.value(value: config),
        RepositoryProvider<RoutesPreloadingService>.value(value: routesPreloadingService),
        RepositoryProvider<DraftService>.value(value: draftService),
      ]);
    return true;
  }
}
