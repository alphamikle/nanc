import 'dart:async';

import 'package:additions/additions.dart' as ad;
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
import 'package:cms/src/service/init/data_repository.dart';
import 'package:cms/src/service/routing/routes_preloading_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fonts/fonts.dart';
import 'package:model/model.dart';
import 'package:nanc_renderer/nanc_renderer.dart';
import 'package:tools/tools.dart';

class Initializer {
  Initializer({
    required this.models,
    required this.pageListApi,
    required this.pageApi,
    required this.config,
    required this.rootKey,
    required this.errorStreamController,
    required this.clickHandlers,
    required this.renderers,
    required this.imageLoadingBuilder,
    required this.imageErrorBuilder,
    required this.imageFrameBuilder,
    required this.customFonts,
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
  final List<ad.RichClickHandler> clickHandlers;
  final List<TagRenderer> renderers;
  final ImageLoadingBuilder? imageLoadingBuilder;
  final ImageErrorWidgetBuilder? imageErrorBuilder;
  final ImageFrameBuilder? imageFrameBuilder;
  final List<CustomFont> customFonts;

  Future<bool> init() async {
    /// ? FONTS
    customFonts.forEach(registerCustomFont);

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
    final PageBloc pageBloc = PageBloc(
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
      pageBloc: pageBloc,
      rootKey: rootKey,
    );

    /// ? PRE-INITIALIZATION
    await modelListProvider.preloadModelsFromCode(models);
    unawaited(modelListProvider.loadDynamicModels(models));
    unawaited(headerBloc.initItems());

    final DataRepository dataRepository = DataRepository(
      clickHandlers: clickHandlers,
      renderers: renderers,
      imageLoadingBuilder: imageLoadingBuilder,
      imageErrorBuilder: imageErrorBuilder,
      imageFrameBuilder: imageFrameBuilder,
    );

    blocProviders
      ..clear()
      ..addAll([
        BlocProvider<PreviewBloc>.value(value: previewBloc),
        BlocProvider<EditorBloc>.value(value: editorBloc),
        BlocProvider<MenuBloc>.value(value: menuBloc),
        BlocProvider<ModelListBloc>.value(value: modelListProvider),
        BlocProvider<CollectionBloc>.value(value: collectionBloc),
        BlocProvider<BasePageBloc<BaseEntityPageState>>.value(value: pageBloc),
        BlocProvider<PageBloc>.value(value: pageBloc),
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
        RepositoryProvider<DataRepository>.value(value: dataRepository),
      ]);
    return true;
  }
}
