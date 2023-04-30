import 'dart:async';

import 'package:additions/additions.dart' as ad;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fonts/fonts.dart';
import 'package:model/model.dart';
import 'package:nanc_config/nanc_config.dart';
import 'package:nanc_renderer/nanc_renderer.dart';
import 'package:tools/tools.dart';

import '../../../cms.dart';
import '../../domain/collection/logic/logic/bloc/collection_bloc.dart';
import '../../domain/collection/logic/logic/provider/collection_provider.dart';
import '../../domain/draft/logic/draft_service.dart';
import '../../domain/general/logic/bloc/header/header_bloc.dart';
import '../../domain/general/logic/bloc/side_menu/menu_bloc.dart';
import '../../domain/model/logic/bloc/model_page_bloc/model_page_bloc.dart';
import '../../domain/model/logic/provider/model_provider.dart';
import '../../domain/page/logic/provider/entity_page_provider.dart';
import '../../domain/preview/logic/bloc/preview_bloc.dart';
import '../../domain/tutorial/logic/bloc/tutorial_bloc.dart';
import '../config/admin_config.dart';
import '../errors/error_wrapper.dart';
import '../routing/routes_preloading_service.dart';
import 'data_repository.dart';

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
  });

  final List<Model> models;
  final ICollectionApi pageListApi;
  final IPageApi pageApi;
  final AdminConfig config;

  final RootKey rootKey;
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
    final CollectionProvider pageListProvider = CollectionProvider(api: pageListApi);
    final ModelProvider modelProvider = ModelProvider(pageProvider: pageProvider, collectionProvider: pageListProvider);

    /// ? ENTITY WITH NAV
    final ModelListBloc modelListProvider = ModelListBloc(modelProvider: modelProvider);

    /// ? BLOCS
    final PreviewBloc previewBloc = PreviewBloc(eventBus: eventBus);
    final EditorBloc editorBloc = EditorBloc(eventBus: eventBus);
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
        RepositoryProvider<ICollectionProvider>.value(value: pageListProvider),
        RepositoryProvider<CollectionProvider>.value(value: pageListProvider),
        RepositoryProvider<IPageProvider>.value(value: pageProvider),
        RepositoryProvider<PageProvider>.value(value: pageProvider),
        RepositoryProvider<AdminConfig>.value(value: config),
        RepositoryProvider<RoutesPreloadingService>.value(value: routesPreloadingService),
        RepositoryProvider<DraftService>.value(value: draftService),
        RepositoryProvider<DataRepository>.value(value: dataRepository),
      ]);
    return true;
  }
}
