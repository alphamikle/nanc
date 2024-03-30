import 'package:flutter/material.dart';
import 'package:nanc_icons/nanc_icons.dart';
import 'package:nui_converter/nui_converter.dart';

import '../../documentation/documentation.dart';
import '../../rich_renderer.dart';
import '../../tag_description.dart';
import '../../tag_renderer.dart';
import '../../tools/properties_extractor.dart';
import '../../tools/properties_names.dart';
import '../../tools/widgets_compactor.dart';
import 'material_arguments.dart';

TagRenderer materialRenderer() {
  return TagRenderer(
    icon: IconPack.mdi_material_design,
    tagType: TagType.widget,
    tag: 'material',
    description: TagDescription(
      description: '''
# [Material](https://api.flutter.dev/flutter/material/Material-class.html)

A piece of material.

The Material widget is responsible for:

1.  Clipping: If [clipBehavior](material/Material/clipBehavior.html) is not [Clip.none](dart-ui/Clip.html), Material clips its widget sub-tree to the shape specified by [shape](material/Material/shape.html), [type](material/Material/type.html), and [borderRadius](material/Material/borderRadius.html). By default, [clipBehavior](material/Material/clipBehavior.html) is [Clip.none](dart-ui/Clip.html) for performance considerations. See [Ink](material/Ink-class.html) for an example of how this affects clipping [Ink](material/Ink-class.html) widgets.
2.  Elevation: Material elevates its widget sub-tree on the Z axis by [elevation](material/Material/elevation.html) pixels, and draws the appropriate shadow.
3.  Ink effects: Material shows ink effects implemented by [InkFeature](material/InkFeature-class.html)s like [InkSplash](material/InkSplash-class.html) and [InkHighlight](material/InkHighlight-class.html) below its children.

The Material Metaphor
---------------------

Material is the central metaphor in Material Design. Each piece of material exists at a given elevation, which influences how that piece of material visually relates to other pieces of material and how that material casts shadows.

Most user interface elements are either conceptually printed on a piece of material or themselves made of material. Material reacts to user input using [InkSplash](material/InkSplash-class.html) and [InkHighlight](material/InkHighlight-class.html) effects. To trigger a reaction on the material, use a [MaterialInkController](material/MaterialInkController-class.html) obtained via [Material.of](material/Material/of.html).

In general, the features of a [Material](material/Material-class.html) should not change over time (e.g. a [Material](material/Material-class.html) should not change its [color](material/Material/color.html), [shadowColor](material/Material/shadowColor.html) or [type](material/Material/type.html)). Changes to [elevation](material/Material/elevation.html), [shadowColor](material/Material/shadowColor.html) and [surfaceTintColor](material/Material/surfaceTintColor.html) are animated for [animationDuration](material/Material/animationDuration.html). Changes to [shape](material/Material/shape.html) are animated if [type](material/Material/type.html) is not [MaterialType.transparency](material/MaterialType.html) and [ShapeBorder.lerp](painting/ShapeBorder/lerp.html) between the previous and next [shape](material/Material/shape.html) values is supported. Shape changes are also animated for [animationDuration](material/Material/animationDuration.html).

Shape
-----

The shape for material is determined by [shape](material/Material/shape.html), [type](material/Material/type.html), and [borderRadius](material/Material/borderRadius.html).

*   If [shape](material/Material/shape.html) is non null, it determines the shape.
*   If [shape](material/Material/shape.html) is null and [borderRadius](material/Material/borderRadius.html) is non null, the shape is a rounded rectangle, with corners specified by [borderRadius](material/Material/borderRadius.html).
*   If [shape](material/Material/shape.html) and [borderRadius](material/Material/borderRadius.html) are null, [type](material/Material/type.html) determines the shape as follows:
    *   [MaterialType.canvas](material/MaterialType.html): the default material shape is a rectangle.
    *   [MaterialType.card](material/MaterialType.html): the default material shape is a rectangle with rounded edges. The edge radii is specified by [kMaterialEdges](material/kMaterialEdges-constant.html).
    *   [MaterialType.circle](material/MaterialType.html): the default material shape is a circle.
    *   [MaterialType.button](material/MaterialType.html): the default material shape is a rectangle with rounded edges. The edge radii is specified by [kMaterialEdges](material/kMaterialEdges-constant.html).
    *   [MaterialType.transparency](material/MaterialType.html): the default material shape is a rectangle.

Border
------

If [shape](material/Material/shape.html) is not null, then its border will also be painted (if any).

Layout change notifications
---------------------------

If the layout changes (e.g. because there's a list on the material, and it's been scrolled), a [LayoutChangedNotification](widgets/LayoutChangedNotification-class.html) must be dispatched at the relevant subtree. This in particular means that transitions (e.g. [SlideTransition](widgets/SlideTransition-class.html)) should not be placed inside [Material](material/Material-class.html) widgets so as to move subtrees that contain [InkResponse](material/InkResponse-class.html)s, [InkWell](material/InkWell-class.html)s, [Ink](material/Ink-class.html)s, or other widgets that use the [InkFeature](material/InkFeature-class.html) mechanism. Otherwise, in-progress ink features (e.g., ink splashes and ink highlights) won't move to account for the new layout.

Painting over the material
--------------------------

Material widgets will often trigger reactions on their nearest material ancestor. For example, [ListTile.hoverColor](material/ListTile/hoverColor.html) triggers a reaction on the tile's material when a pointer is hovering over it. These reactions will be obscured if any widget in between them and the material paints in such a way as to obscure the material (such as setting a [BoxDecoration.color](painting/BoxDecoration/color.html) on a [DecoratedBox](widgets/DecoratedBox-class.html)). To avoid this behavior, use [InkDecoration](material/InkDecoration-class.html) to decorate the material itself.

See also:

*   [MergeableMaterial](material/MergeableMaterial-class.html), a piece of material that can split and re-merge.
*   [Card](material/Card-class.html), a wrapper for a [Material](material/Material-class.html) of [type](material/Material/type.html) [MaterialType.card](material/MaterialType.html).
*   [material.io/design/](https://material.io/design/)
*   [m3.material.io/styles/color/the-color-system/color-roles](https://m3.material.io/styles/color/the-color-system/color-roles)
''',
      arguments: [
        materialTypeArgument(name: 'type'),
        colorArgument(name: 'color'),
      ],
      properties: [
        borderRadiusProp(),
      ],
    ),
    example: '''
<safeArea>
  <center>
    <stack>
      <container height="200" width="200" color="#457FDA">
      </container>
      <positioned all="0">
        <!-- Try to remove <material> to see the difference -->
        <material type="transparency">
          <prop:borderRadius all="12"/>
          <inkWell onPressed="snackbar: InkWell was pressed!" hoverColor="#FFC600">
          </inkWell>
        </material>
      </positioned>
    </stack>
  </center>
</safeArea>
''',
    builder: (BuildContext context, WidgetTag element, RichRenderer richRenderer) {
      final MaterialArguments arguments = MaterialArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: richRenderer.renderChildren(context, element.children));
      final BorderRadius? radius = extractor.getProperty<BorderRadius>(borderRadius);

      return Material(
        key: (arguments.key?.isEmpty ?? true) ? null : ValueKey(arguments.key),
        type: arguments.type ?? MaterialType.canvas,
        color: arguments.color,
        borderRadius: radius,
        child: compactWidgets(extractor.children),
      );
    },
  );
}
