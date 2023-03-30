import 'dart:async';

import 'package:rich_renderer/rich_renderer.dart';
import 'package:rich_renderer/src/renderers/align/align_renderer.dart';
import 'package:rich_renderer/src/renderers/aspect_ratio/aspect_ratio_renderer.dart';
import 'package:rich_renderer/src/renderers/center/center_renderer.dart';
import 'package:rich_renderer/src/renderers/clipr_rect/clipr_rect_renderer.dart';
import 'package:rich_renderer/src/renderers/column/column_renderer.dart';
import 'package:rich_renderer/src/renderers/component/component_renderer.dart';
import 'package:rich_renderer/src/renderers/container/container_renderer.dart';
import 'package:rich_renderer/src/renderers/data/data_renderer.dart';
import 'package:rich_renderer/src/renderers/divider/divider_renderer.dart';
import 'package:rich_renderer/src/renderers/expanded/expanded_renderer.dart';
import 'package:rich_renderer/src/renderers/fade_in/fade_in_renderer.dart';
import 'package:rich_renderer/src/renderers/for/for_renderer.dart';
import 'package:rich_renderer/src/renderers/fractional_translation/fractional_translation_renderer.dart';
import 'package:rich_renderer/src/renderers/icon/icon_renderer.dart';
import 'package:rich_renderer/src/renderers/if/show_renderer.dart';
import 'package:rich_renderer/src/renderers/image/image_renderer.dart';
import 'package:rich_renderer/src/renderers/ink_well/ink_well_renderer.dart';
import 'package:rich_renderer/src/renderers/list_view/list_view_renderer.dart';
import 'package:rich_renderer/src/renderers/material/material_renderer.dart';
import 'package:rich_renderer/src/renderers/padding/padding_renderer.dart';
import 'package:rich_renderer/src/renderers/physical_model/physical_model_renderer.dart';
import 'package:rich_renderer/src/renderers/placeholder/placeholder_renderer.dart';
import 'package:rich_renderer/src/renderers/positioned/positioned_renderer.dart';
import 'package:rich_renderer/src/renderers/property/property_renderer.dart';
import 'package:rich_renderer/src/renderers/row/row_renderer.dart';
import 'package:rich_renderer/src/renderers/safe_area/safe_area_renderer.dart';
import 'package:rich_renderer/src/renderers/scale/scale_renderer.dart';
import 'package:rich_renderer/src/renderers/sized_box/sized_box_renderer.dart';
import 'package:rich_renderer/src/renderers/stack/stack_renderer.dart';
import 'package:rich_renderer/src/renderers/template/template_renderer.dart';
import 'package:rich_renderer/src/renderers/text/text_renderer.dart';
import 'package:rich_renderer/src/renderers/text_button/text_button_renderer.dart';
import 'package:rich_renderer/src/renderers/tooltip/tooltip_renderer.dart';

class TagsRenderer {
  factory TagsRenderer() => _instance ??= TagsRenderer._();

  TagsRenderer._();

  static TagsRenderer? _instance;

  final Set<TagRendererFactory> _renderers = {};
  bool _defaultRenderersWasRegistered = false;

  List<TagRendererFactory> get renderers => _returnRenderers();

  void _registerDefaultRenderers() {
    if (_defaultRenderersWasRegistered) {
      return;
    }
    _defaultRenderersWasRegistered = true;
    _renderers.addAll([
      ...propertiesRenderers(),
      paddingRenderer,
      rowRenderer,
      placeholderRenderer,
      containerRenderer,
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
      // codeRenderer,
      safeAreaRenderer,
      alignRenderer,
      fractionalTranslationRenderer,
      scaleRenderer,
      physicalModelRenderer,
      showRenderer,
      fadeInRenderer,
      tooltipRenderer,
      aspectRatioRenderer,
      textButtonRenderer,
      listViewRenderer,
    ]);
  }

  void registerRenderer(TagRendererFactory renderer) {
    if (_renderers.contains(renderer)) {
      return;
    }
    _renderers.add(renderer);
  }

  List<TagRendererFactory> _returnRenderers() {
    _registerDefaultRenderers();
    final List<TagRendererFactory> renderers = [..._renderers];
    renderers.sort((TagRendererFactory first, TagRendererFactory second) {
      final FutureOr<TagRenderer> firstFutureOrRenderer = first();
      final FutureOr<TagRenderer> secondFutureOrRenderer = second();
      late final String firstName;
      late final String secondName;
      if (firstFutureOrRenderer is! Future) {
        firstName = firstFutureOrRenderer.tag;
      } else {
        firstName = '?';
      }
      if (secondFutureOrRenderer is! Future) {
        secondName = secondFutureOrRenderer.tag;
      } else {
        secondName = '?';
      }
      return firstName.compareTo(secondName);
    });
    return [...renderers];
  }
}
