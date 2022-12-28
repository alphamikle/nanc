import 'package:rich_renderer/rich_renderer.dart';
import 'package:rich_renderer/src/renderers/center/center_renderer.dart';
import 'package:rich_renderer/src/renderers/clipr_rect/clipr_rect_renderer.dart';
import 'package:rich_renderer/src/renderers/column/column_renderer.dart';
import 'package:rich_renderer/src/renderers/component/component_renderer.dart';
import 'package:rich_renderer/src/renderers/container/container_renderer.dart';
import 'package:rich_renderer/src/renderers/data/data_renderer.dart';
import 'package:rich_renderer/src/renderers/description/description_renderer.dart';
import 'package:rich_renderer/src/renderers/divider/divider_renderer.dart';
import 'package:rich_renderer/src/renderers/expanded/expanded_renderer.dart';
import 'package:rich_renderer/src/renderers/for/for_renderer.dart';
import 'package:rich_renderer/src/renderers/icon/icon_renderer.dart';
import 'package:rich_renderer/src/renderers/image/image_renderer.dart';
import 'package:rich_renderer/src/renderers/ink_well/ink_well_renderer.dart';
import 'package:rich_renderer/src/renderers/material/material_renderer.dart';
import 'package:rich_renderer/src/renderers/padding/padding_renderer.dart';
import 'package:rich_renderer/src/renderers/placeholder/placeholder_renderer.dart';
import 'package:rich_renderer/src/renderers/positioned/positioned_renderer.dart';
import 'package:rich_renderer/src/renderers/property/property_renderer.dart';
import 'package:rich_renderer/src/renderers/row/row_renderer.dart';
import 'package:rich_renderer/src/renderers/sized_box/sized_box_renderer.dart';
import 'package:rich_renderer/src/renderers/stack/stack_renderer.dart';
import 'package:rich_renderer/src/renderers/template/template_renderer.dart';
import 'package:rich_renderer/src/renderers/text/text_renderer.dart';

class TagsRenderer {
  factory TagsRenderer() => _instance ??= TagsRenderer._();

  TagsRenderer._();

  static TagsRenderer? _instance;

  final List<TagRendererFactory> _renderers = [];
  bool _defaultRenderersWasRegistered = false;

  Future<List<TagRendererFactory>> get renderers => _returnRenderers();

  Future<void> _registerDefaultRenderers() async {
    if (_defaultRenderersWasRegistered) {
      return;
    }
    _defaultRenderersWasRegistered = true;
    _renderers.addAll([
      ...(await propertiesRenderers()),
      paddingRenderer,
      rowRenderer,
      placeholderRenderer,
      containerRenderer,
      descriptionRenderer,
      columnRenderer,
      inkWellRenderer,
      textRenderer,
      expandedRenderer,
      centerRenderer,
      iconRenderer,
      dividerRenderer,
      imageRenderer,
      clipRRectRenderer,
      stackRenderer,
      positionedRenderer,
      dataRenderer,
      forRenderer,
      templateRenderer,
      componentRenderer,
      materialRenderer,
      sizedBoxRenderer,
    ]);
  }

  void registerRenderer(TagRendererFactory renderer) => _renderers.add(renderer);

  Future<List<TagRendererFactory>> _returnRenderers() async {
    await _registerDefaultRenderers();
    // TODO(alphamikle): Sort renderers alphabetically
    // final List<TagRenderer> renderers = _renderers.map((TagRendererFactory factory) => factory()).toList();
    // _renderers.sort((first, second) {
    //
    // });
    return [..._renderers];
  }
}
