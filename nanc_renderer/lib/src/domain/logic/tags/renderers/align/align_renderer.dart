import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:nanc_renderer/src/domain/logic/tags/documentation/documentation.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/align/align_arguments.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/property/mapper/properties_extractor.dart';
import 'package:nanc_renderer/src/domain/logic/tags/rich_renderer.dart';
import 'package:nanc_renderer/src/domain/logic/tags/tag_description.dart';
import 'package:nanc_renderer/src/domain/logic/tags/tag_renderer.dart';
import 'package:nanc_renderer/src/domain/logic/tags/tools/widgets_compactor.dart';

TagRenderer alignRenderer() {
  return TagRenderer(
    icon: IconPack.mdi_align_vertical_center,
    tag: 'align',
    pattern: RegExp(r'<align.*>'),
    endPattern: RegExp('</align>'),
    description: TagDescription(
      description: '''
# [Align](https://api.flutter.dev/flutter/widgets/Align-class.html)

A widget that aligns its child within itself and optionally sizes itself based on the child's size.

For example, to align a box at the bottom right, you would pass this box a tight constraint that is bigger than the child's natural size, with an alignment of [Alignment.bottomRight](painting/Alignment/bottomRight-constant.html).

This widget will be as big as possible if its dimensions are constrained and [widthFactor](widgets/Align/widthFactor.html) and [heightFactor](widgets/Align/heightFactor.html) are null. If a dimension is unconstrained and the corresponding size factor is null then the widget will match its child's size in that dimension. If a size factor is non-null then the corresponding dimension of this widget will be the product of the child's dimension and the size factor. For example if widthFactor is 2.0 then the width of this widget will always be twice its child's width.
''',
      arguments: [
        xArg(),
        yArg(),
        alignmentArg(),
        doubleArg('heightFactor'),
        doubleArg('widthFactor'),
      ],
      properties: [],
    ),
    example: '''
<safeArea>
  <stack>
    <container height="400" width="400" color="#457FDA">
    </container>
    <positioned all="0">
      <align x="-1" y="-1">
        <container height="50" width="50" color="#7BDA45">
        </container>
      </align>
    </positioned>
    <positioned all="0">
      <align align="bottomRight">
        <container height="50" width="50" color="#DA9745">
        </container>
      </align>
    </positioned>
    <positioned all="0">
      <align align="center">
        <container height="50" width="50" color="#7BDA45">
        </container>
      </align>
    </positioned>
  </stack>
</safeArea>
''',
    builder: (BuildContext context, md.Element element, RichRenderer richRenderer) {
      final AlignArguments arguments = AlignArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: richRenderer.renderChildren(context, element.children));

      return Align(
        alignment: arguments.toAlignment() ?? Alignment.center,
        heightFactor: arguments.heightFactor,
        widthFactor: arguments.widthFactor,
        child: compactWidgets(extractor.children),
      );
    },
  );
}
