import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nanc_configuration/nanc_configuration.dart';
import 'package:nanc_fonts/nanc_fonts.dart';
import 'package:nanc_icons/nanc_icons.dart';
import 'package:nanc_renderer/nanc_renderer.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../../domain/collection/logic/logic/bloc/collection_bloc.dart';
import '../../domain/collection/logic/logic/provider/collection_provider.dart';
import '../../domain/document/logic/bloc/base_document_bloc/base_document_bloc.dart';
import '../../domain/document/logic/bloc/base_document_bloc/base_page_state.dart';
import '../../domain/document/logic/bloc/document_bloc/document_bloc.dart';
import '../../domain/document/logic/provider/document_provider.dart';
import '../../domain/draft/logic/draft_service.dart';
import '../../domain/editor/logic/bloc/editor/editor_bloc.dart';
import '../../domain/field/logic/bloc/local_page_bloc/local_page_bloc.dart';
import '../../domain/general/logic/bloc/header/header_bloc.dart';
import '../../domain/general/logic/bloc/side_menu/menu_bloc.dart';
import '../../domain/model/logic/bloc/model_list_bloc/model_list_bloc.dart';
import '../../domain/model/logic/bloc/model_page_bloc/model_page_bloc.dart';
import '../../domain/model/logic/model/logic/model.dart';
import '../../domain/model/logic/provider/model_provider.dart';
import '../../domain/preview/logic/bloc/preview_bloc.dart';
import '../../domain/tutorial/logic/bloc/tutorial_bloc.dart';
import '../config/cms_config.dart';
import '../errors/human_exception.dart';
import '../routing/routes.dart';
import '../routing/routes_preloading_service.dart';
import 'data_repository.dart';

class Initializer {
  Initializer({
    required this.config,
    required this.rootKey,
    required this.errorStreamController,
  });

  final CmsConfig config;
  final StreamController<HumanException> errorStreamController;
  final RootKey rootKey;

  final List<BlocProvider<dynamic>> blocProviders = [];
  final List<RepositoryProvider<dynamic>> repositoryProviders = [];
  late final GoRouter router;

  Future<bool> init() async {
    /// ? ICONS
    if (config.customIcons?.isNotEmpty ?? false) {
      IconsStorage.registerCustomIcons(config.customIcons!);
    }

    /// ? FONTS
    FontsStorage.registerCustomFonts(config.customFonts);

    /// ? SERVICES
    final EventBus eventBus = EventBus();
    final DbService dbService = DbService();
    final DraftService draftService = DraftService(dbService: dbService);

    /// ? PROVIDERS
    final DocumentProvider pageProvider = DocumentProvider(api: config.documentApi);
    final CollectionProvider collectionProvider = CollectionProvider(api: config.collectionApi);
    final ModelProvider modelProvider = ModelProvider(
      pageProvider: pageProvider,
      collectionProvider: collectionProvider,
      modelApi: config.modelApi,
    );

    /// ? ENTITY WITH NAV
    final ModelListBloc modelListBloc = ModelListBloc(modelProvider: modelProvider);

    /// ? BLOCS
    final PreviewBloc previewBloc = PreviewBloc(eventBus: eventBus);
    final EditorBloc editorBloc = EditorBloc(eventBus: eventBus);
    final MenuBloc menuBloc = MenuBloc(modelListBloc: modelListBloc);
    final HeaderBloc headerBloc = HeaderBloc();
    final ModelPageBloc modelPageBloc = ModelPageBloc(
      modelCollectionBloc: modelListBloc,
      rootKey: rootKey,
      modelProvider: modelProvider,
      menuBloc: menuBloc,
      eventBus: eventBus,
    );
    final TutorialBloc tutorialBloc = TutorialBloc(dbService: dbService, rootKey: rootKey);
    final CollectionBloc collectionBloc = CollectionBloc(
      modelCollectionBloc: modelListBloc,
      pageListProvider: collectionProvider,
      eventBus: eventBus,
      filterStructureBloc: LocalPageBloc(draftService: draftService),
    );
    final DocumentBloc pageBloc = DocumentBloc(
      modelCollectionBloc: modelListBloc,
      documentProvider: pageProvider,
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
    router = buildRouter(routesPreloadingService, rootKey);
    final SettingsBloc settingsBloc = SettingsBloc(dbService: dbService);
    menuBloc.initRouter(router);

    /// ? PRE-INITIALIZATION
    final List<Model> predefinedModels = config.predefinedModels.cast<Model>();

    await modelListBloc.preloadModelsFromCode(predefinedModels);
    unawaited(modelListBloc.loadDynamicModels(predefinedModels));
    unawaited(settingsBloc.preloadSettings());
    unawaited(headerBloc.initItems());

    final List<TagRenderer> allRenderers = [...config.customRenderers, ...TagsCollection.renderers];

    _checkRenderersForUniqueness(allRenderers);

    final DataRepository dataRepository = DataRepository(
      eventsHandlers: config.eventsHandlers,
      renderers: allRenderers,
      imageLoadingBuilder: config.imageBuilderDelegate?.imageLoadingBuilder,
      imageErrorBuilder: config.imageBuilderDelegate?.imageErrorWidgetBuilder,
      imageFrameBuilder: config.imageBuilderDelegate?.imageFrameBuilder,
      supportedFilters: config.collectionApi.supportedFilters,
      sliverChecker: config.sliverChecker,
      themeBuilder: config.themeBuilder,
    );

    blocProviders
      ..clear()
      ..addAll([
        BlocProvider<PreviewBloc>.value(value: previewBloc),
        BlocProvider<EditorBloc>.value(value: editorBloc),
        BlocProvider<MenuBloc>.value(value: menuBloc),
        BlocProvider<ModelListBloc>.value(value: modelListBloc),
        BlocProvider<CollectionBloc>.value(value: collectionBloc),
        BlocProvider<BaseDocumentBloc<BaseDocumentState>>.value(value: pageBloc),
        BlocProvider<DocumentBloc>.value(value: pageBloc),
        BlocProvider<ModelPageBloc>.value(value: modelPageBloc),
        BlocProvider<HeaderBloc>.value(value: headerBloc),
        BlocProvider<TutorialBloc>.value(value: tutorialBloc),
        BlocProvider<SettingsBloc>.value(value: settingsBloc),
      ]);

    repositoryProviders
      ..clear()
      ..addAll([
        RepositoryProvider<RootKey>.value(value: rootKey),
        RepositoryProvider<EventBus>.value(value: eventBus),
        RepositoryProvider<ModelProvider>.value(value: modelProvider),
        RepositoryProvider<ICollectionProvider>.value(value: collectionProvider),
        RepositoryProvider<CollectionProvider>.value(value: collectionProvider),
        RepositoryProvider<IDocumentProvider>.value(value: pageProvider),
        RepositoryProvider<DocumentProvider>.value(value: pageProvider),
        RepositoryProvider<NetworkConfig>.value(value: config.networkConfig),
        RepositoryProvider<RoutesPreloadingService>.value(value: routesPreloadingService),
        RepositoryProvider<DraftService>.value(value: draftService),
        RepositoryProvider<DataRepository>.value(value: dataRepository),
        RepositoryProvider<StreamController<HumanException>>.value(value: errorStreamController),
      ]);
    return true;
  }

  void _checkRenderersForUniqueness(List<TagRenderer> renderers) {
    final Set<String> tags = {};

    for (final TagRenderer renderer in renderers) {
      if (tags.contains(renderer.tag)) {
        throw Exception('Found duplicate of already registered tag: "${renderer.tag}"');
      }
      tags.add(renderer.tag);
    }
  }
}
