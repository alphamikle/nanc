import 'package:fonts/fonts.dart';
import 'package:model/model.dart';
import 'package:nanc_config/nanc_config.dart';
import 'package:nanc_renderer/nanc_renderer.dart';

class CmsConfig {
  const CmsConfig({
    required this.collectionApi,
    required this.pageApi,
    required this.modelApi,
    required this.networkConfig,
    required this.imageBuilderDelegate,
    required this.adminWrapperBuilder,
    required this.predefinedModels,
    required this.customRenderers,
    required this.clickHandlers,
    required this.customFonts,
  });

  final ICollectionApi collectionApi;
  final IPageApi pageApi;
  final IModelApi modelApi;
  final NetworkConfig networkConfig;
  final ImageBuilderDelegate? imageBuilderDelegate;
  final AdminWrapperBuilder? adminWrapperBuilder;
  final List<Model> predefinedModels;
  final List<TagRenderer> customRenderers;
  final List<ClickHandler> clickHandlers;
  final List<CustomFont> customFonts;
}
