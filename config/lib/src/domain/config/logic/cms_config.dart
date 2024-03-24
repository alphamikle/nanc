import 'package:flutter/material.dart';
import 'package:fonts/fonts.dart';
import 'package:nanc_renderer/nanc_renderer.dart';

import '../../collection/logic/provider/collection_api_interface.dart';
import '../../document/logic/provider/document_api_interface.dart';
import '../../event_handler/logic/event_handler.dart';
import '../../model/logic/api/model_api_interface.dart';
import '../../model/logic/model/model_interface.dart';
import 'admin_wrapper_interface.dart';
import 'image_builder_delegate.dart';
import 'network_config.dart';

typedef IconName = String;
typedef CustomIcons = Map<IconName, IconData>;
typedef ThemeDataBuilder = ThemeData Function(BuildContext context);

class CmsConfig {
  const CmsConfig({
    required this.collectionApi,
    required this.documentApi,
    required this.modelApi,
    required this.networkConfig,
    required this.imageBuilderDelegate,
    required this.adminWrapperBuilder,
    required this.predefinedModels,
    required this.customRenderers,
    required this.eventsHandlers,
    required this.customFonts,
    required this.sliverChecker,
    required this.customIcons,
    required this.themeBuilder,
  });

  final ICollectionApi collectionApi;
  final IDocumentApi documentApi;
  final IModelApi modelApi;
  final NetworkConfig networkConfig;
  final ImageBuilderDelegate? imageBuilderDelegate;
  final AdminWrapperBuilder? adminWrapperBuilder;
  final List<IModel> predefinedModels;
  final List<TagRenderer> customRenderers;
  final List<EventHandler> eventsHandlers;
  final List<CustomFont> customFonts;
  final SliverChecker? sliverChecker;
  final CustomIcons? customIcons;
  final ThemeDataBuilder? themeBuilder;
}
