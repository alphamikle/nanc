import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:nanc_renderer/src/domain/logic/tags/documentation/documentation.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/property/mapper/properties_extractor.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/sized_box/sized_box_arguments.dart';
import 'package:nanc_renderer/src/domain/logic/tags/rich_renderer.dart';
import 'package:nanc_renderer/src/domain/logic/tags/tag_description.dart';
import 'package:nanc_renderer/src/domain/logic/tags/tag_renderer.dart';
import 'package:nanc_renderer/src/domain/logic/tags/tools/widgets_compactor.dart';

TagRenderer sizedBoxRenderer() {
  return TagRenderer(
    icon: IconPack.mdi_move_resize,
    tag: 'sizedBox',
    description: TagDescription(
      description: '''
# [SizedBox](https://api.flutter.dev/flutter/widgets/SizedBox-class.html)

A box with a specified size.

If given a child, this widget forces it to have a specific width and/or height. These values will be ignored if this widget's parent does not permit them. For example, this happens if the parent is the screen (forces the child to be the same size as the parent), or another [SizedBox](widgets/SizedBox-class.html) (forces its child to have a specific width and/or height). This can be remedied by wrapping the child [SizedBox](widgets/SizedBox-class.html) in a widget that does permit it to be any size up to the size of the parent, such as [Center](widgets/Center-class.html) or [Align](widgets/Align-class.html).

If either the width or height is null, this widget will try to size itself to match the child's size in that dimension. If the child's size depends on the size of its parent, the height and width must be provided.

If not given a child, [SizedBox](widgets/SizedBox-class.html) will try to size itself as close to the specified height and width as possible given the parent's constraints. If [height](widgets/SizedBox/height.html) or [width](widgets/SizedBox/width.html) is null or unspecified, it will be treated as zero.

The [SizedBox.expand](widgets/SizedBox/SizedBox.expand.html) constructor can be used to make a [SizedBox](widgets/SizedBox-class.html) that sizes itself to fit the parent. It is equivalent to setting [width](widgets/SizedBox/width.html) and [height](widgets/SizedBox/height.html) to [double.infinity](dart-core/double/infinity-constant.html).
''',
      arguments: [
        heightArg(),
        widthArg(),
        sizeArg(),
      ],
      properties: [],
    ),
    example: '''
<safeArea>
  <center>
    <sizedBox size="50">
      <container color="#457FDA">
      </container>
    </sizedBox>
  </center>
</safeArea>
''',
    builder: (BuildContext context, md.Element element, RichRenderer richRenderer) {
      final SizedBoxArguments arguments = SizedBoxArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: richRenderer.renderChildren(context, element.children));
      final double? size = arguments.size;

      return SizedBox(
        height: size ?? arguments.height,
        width: size ?? arguments.width,
        child: compactWidgets(extractor.children),
      );
    },
  );
}
