import 'package:fonts/fonts.dart';
import 'package:model/model.dart';
import 'package:nanc_renderer/nanc_renderer.dart';

import '../../click_handler/logic/click_handler.dart';
import '../../collection/logic/provider/collection_api_interface.dart';
import '../../document/logic/provider/document_api_interface.dart';
import '../../model/logic/api/model_api_interface.dart';
import 'admin_wrapper_interface.dart';
import 'image_builder_delegate.dart';
import 'network_config.dart';

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
    required this.clickHandlers,
    required this.customFonts,
  });

  final ICollectionApi collectionApi;
  final IDocumentApi documentApi;
  final IModelApi modelApi;
  final NetworkConfig networkConfig;
  final ImageBuilderDelegate? imageBuilderDelegate;
  final AdminWrapperBuilder? adminWrapperBuilder;
  final List<Model> predefinedModels;
  final List<TagRenderer> customRenderers;
  final List<ClickHandler> clickHandlers;
  final List<CustomFont> customFonts;
}
