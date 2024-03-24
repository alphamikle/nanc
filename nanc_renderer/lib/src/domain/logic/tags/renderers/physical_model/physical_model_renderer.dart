import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:tag_converter/tag_converter.dart';

import '../../documentation/documentation.dart';
import '../../rich_renderer.dart';
import '../../tag_description.dart';
import '../../tag_renderer.dart';
import '../../tools/properties_extractor.dart';
import '../../tools/properties_names.dart';
import '../../tools/widgets_compactor.dart';
import 'physical_model_arguments.dart';

TagRenderer physicalModelRenderer() {
  return TagRenderer(
    icon: IconPack.mdi_box_shadow,
    tagType: TagType.widget,
    tag: 'physicalModel',
    description: TagDescription(
      description: '''
# [Physical Model](https://api.flutter.dev/flutter/widgets/PhysicalModel-class.html)

A widget representing a physical layer that clips its children to a shape.

Physical layers cast shadows based on an [elevation](widgets/PhysicalModel/elevation.html) which is nominally in logical pixels, coming vertically out of the rendering surface.

For shapes that cannot be expressed as a rectangle with rounded corners use [PhysicalShape](widgets/PhysicalShape-class.html).
''',
      arguments: [
        colorArgument(name: 'color'),
        clipArgument(name: 'clip'),
        elevationArgument(),
        colorArgument(name: 'shadowColor'),
        shapeArgument(name: 'shape'),
      ],
      properties: [
        borderRadiusProp(),
      ],
    ),
    example: '''
<safeArea>
  <center>
  <physicalModel elevation="20" shape="circle">
    <prop:borderRadius all="0"/>
    <container width="100" height="100" color="#457FDA">
      <prop:decoration>
        <prop:borderRadius all="100"/>
      </prop:decoration>
    </container>
  </physicalModel>
  </center>
</safeArea>
''',
    builder: (BuildContext context, WidgetTag element, RichRenderer richRenderer) {
      final PhysicalModelArguments arguments = PhysicalModelArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: richRenderer.renderChildren(context, element.children));

      return PhysicalModel(
        key: (arguments.key?.isEmpty ?? true) ? null : ValueKey(arguments.key),
        color: arguments.color ?? Colors.transparent,
        borderRadius: extractor.getProperty(borderRadius),
        clipBehavior: arguments.clip ?? Clip.none,
        elevation: arguments.elevation ?? 0,
        shadowColor: arguments.shadowColor ?? Colors.black,
        shape: arguments.shape ?? BoxShape.rectangle,
        child: compactWidgets(extractor.children),
      );
    },
  );
}
