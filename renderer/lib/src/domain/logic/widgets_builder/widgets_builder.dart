import 'dart:async';

import 'package:flutter/material.dart';
import 'package:renderer/src/domain/logic/renderers/align/align_renderer.dart';
import 'package:renderer/src/domain/logic/renderers/aspect_ratio/aspect_ratio_renderer.dart';
import 'package:renderer/src/domain/logic/renderers/center/center_renderer.dart';
import 'package:renderer/src/domain/logic/renderers/clipr_rect/clipr_rect_renderer.dart';
import 'package:renderer/src/domain/logic/renderers/column/column_renderer.dart';
import 'package:renderer/src/domain/logic/renderers/component/component_renderer.dart';
import 'package:renderer/src/domain/logic/renderers/container/container_renderer.dart';
import 'package:renderer/src/domain/logic/renderers/data/data_renderer.dart';
import 'package:renderer/src/domain/logic/renderers/divider/divider_renderer.dart';
import 'package:renderer/src/domain/logic/renderers/expanded/expanded_renderer.dart';
import 'package:renderer/src/domain/logic/renderers/fade_in/fade_in_renderer.dart';
import 'package:renderer/src/domain/logic/renderers/for/for_renderer.dart';
import 'package:renderer/src/domain/logic/renderers/fractional_translation/fractional_translation_renderer.dart';
import 'package:renderer/src/domain/logic/renderers/icon/icon_renderer.dart';
import 'package:renderer/src/domain/logic/renderers/if/show_renderer.dart';
import 'package:renderer/src/domain/logic/renderers/image/image_renderer.dart';
import 'package:renderer/src/domain/logic/renderers/ink_well/ink_well_renderer.dart';
import 'package:renderer/src/domain/logic/renderers/list_view/list_view_renderer.dart';
import 'package:renderer/src/domain/logic/renderers/material/material_renderer.dart';
import 'package:renderer/src/domain/logic/renderers/padding/padding_renderer.dart';
import 'package:renderer/src/domain/logic/renderers/physical_model/physical_model_renderer.dart';
import 'package:renderer/src/domain/logic/renderers/placeholder/placeholder_renderer.dart';
import 'package:renderer/src/domain/logic/renderers/positioned/positioned_renderer.dart';
import 'package:renderer/src/domain/logic/renderers/row/row_renderer.dart';
import 'package:renderer/src/domain/logic/renderers/safe_area/safe_area_renderer.dart';
import 'package:renderer/src/domain/logic/renderers/scale/scale_renderer.dart';
import 'package:renderer/src/domain/logic/renderers/sized_box/sized_box_renderer.dart';
import 'package:renderer/src/domain/logic/renderers/stack/stack_renderer.dart';
import 'package:renderer/src/domain/logic/renderers/template/template_renderer.dart';
import 'package:renderer/src/domain/logic/renderers/text/text_renderer.dart';
import 'package:renderer/src/domain/logic/renderers/text_button/text_button_renderer.dart';
import 'package:renderer/src/domain/logic/renderers/tooltip/tooltip_renderer.dart';
import 'package:renderer/src/domain/logic/tags/rich_renderer.dart';
import 'package:renderer/src/domain/logic/tags/tag_renderer.dart';
import 'package:xml/xml.dart';

WidgetsBuilder defaultWidgetsBuilderFactory() {
  return WidgetsBuilder.fromTagsRenderers(
    [
      // ...propertiesRenderers(),
      paddingRenderer(),
      rowRenderer(),
      placeholderRenderer(),
      containerRenderer(),
      columnRenderer(),
      inkWellRenderer(),
      textRenderer(),
      expandedRenderer(),
      centerRenderer(),
      iconRenderer(),
      dividerRenderer(),
      imageRenderer(),
      clipRRectRenderer(),
      stackRenderer(),
      positionedRenderer(),
      dataRenderer(),
      forRenderer(),
      templateRenderer(),
      componentRenderer(),
      materialRenderer(),
      sizedBoxRenderer(),
      // codeRenderer(),
      safeAreaRenderer(),
      alignRenderer(),
      fractionalTranslationRenderer(),
      scaleRenderer(),
      physicalModelRenderer(),
      showRenderer(),
      fadeInRenderer(),
      tooltipRenderer(),
      aspectRatioRenderer(),
      textButtonRenderer(),
      listViewRenderer(),
    ],
  );
}

class WidgetsBuilder {
  factory WidgetsBuilder({
    required Map<String, XmlWidgetBuilder> builders,
  }) {
    return WidgetsBuilder._(builders);
  }

  factory WidgetsBuilder.fromTagsRenderers(List<TagRenderer> renderers) {
    final Map<String, XmlWidgetBuilder> builders = {};
    for (final TagRenderer renderer in renderers) {
      builders[renderer.tag] = renderer.builder;
    }
    return WidgetsBuilder._(builders);
  }

  WidgetsBuilder._(this._builders);

  final Map<String, XmlWidgetBuilder> _builders;

  void registerBuilder(String tag, XmlWidgetBuilder builder) => _builders[tag] = builder;

  bool hasTagBuilder(String tag) => _builders.containsKey(tag);

  // TODO(alphamikle): Fix Substitutor logic
  // Future<List<Widget>> renderChildren(BuildContext context, List<md.Node>? nodes) async {
  //   if (nodes == null) {
  //     return [];
  //   }
  //   final List<Widget> children = [];
  //   for (final md.Node node in nodes) {
  //     if (node is md.Element && isRendererRegistered(node.tag)) {
  //       final md.Element newNode = await Substitutor.enrichElement(context: context, node: node);
  //       // ignore: use_build_context_synchronously
  //       final Widget? child = await render(context, newNode);
  //       if (child != null) {
  //         forWidgetFilter(child, children);
  //       }
  //     } else {
  //       final Widget? standardTagWidget = await MarkdownGenerator.renderStandardTag(widgetConfig: widgetConfig, node: node);
  //       children.add(
  //         standardTagWidget ??
  //             ColoredBox(
  //               color: Colors.red.withOpacity(0.5),
  //               child: Padding(
  //                 padding: const EdgeInsets.all(8),
  //                 child: Text('Not supported node: ${node.textContent}'),
  //               ),
  //             ),
  //       );
  //     }
  //   }
  //   return children;
  // }
  FutureOr<List<Widget>> buildChildren(BuildContext context, XmlElement element) {
    final List<FutureOr<Widget?>> children =
  }

  FutureOr<Widget?> build(BuildContext context, XmlElement element) {
    final String tag = element.localName;
    if (hasTagBuilder(tag) == false) {
      return null;
    }
    return _builders[tag]!(context, element, this);
  }
}
