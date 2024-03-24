import 'package:config/config.dart';
import 'package:flutter/material.dart';
import 'package:fonts/fonts.dart';
import 'package:nanc_renderer/nanc_renderer.dart';

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
