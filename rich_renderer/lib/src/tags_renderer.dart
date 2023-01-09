import 'dart:async';

import 'package:rich_renderer/rich_renderer.dart';
import 'package:rich_renderer/src/renderers/align/align_renderer.dart';
import 'package:rich_renderer/src/renderers/center/center_renderer.dart';
import 'package:rich_renderer/src/renderers/clipr_rect/clipr_rect_renderer.dart';
import 'package:rich_renderer/src/renderers/column/column_renderer.dart';
import 'package:rich_renderer/src/renderers/component/component_renderer.dart';
import 'package:rich_renderer/src/renderers/container/container_renderer.dart';
import 'package:rich_renderer/src/renderers/data/data_renderer.dart';
import 'package:rich_renderer/src/renderers/description/description_renderer.dart';
import 'package:rich_renderer/src/renderers/divider/divider_renderer.dart';
import 'package:rich_renderer/src/renderers/expanded/expanded_renderer.dart';
import 'package:rich_renderer/src/renderers/fractional_translation/fractional_translation_renderer.dart';
import 'package:rich_renderer/src/renderers/icon/icon_renderer.dart';
import 'package:rich_renderer/src/renderers/image/image_renderer.dart';
import 'package:rich_renderer/src/renderers/ink_well/ink_well_renderer.dart';
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
      // forRenderer,
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
    ]);
  }

  void registerRenderer(TagRendererFactory renderer) => _renderers.add(renderer);

  Future<List<TagRendererFactory>> _returnRenderers() async {
    await _registerDefaultRenderers();
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
