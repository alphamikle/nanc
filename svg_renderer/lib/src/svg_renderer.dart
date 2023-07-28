import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:icons/icons.dart';
import 'package:nanc_renderer/nanc_renderer.dart';
import 'package:vector_graphics/vector_graphics.dart';

import 'properties/color_filter/color_filter_property.dart';
import 'properties/header/header_property.dart';
import 'svg_arguments.dart';

TagRenderer svgRenderer() {
  return TagRenderer(
    icon: IconPack.mdi_svg,
    tagType: TagType.widget,
    tag: 'svg',
    description: TagDescription(
      description: '''
# Svg

A custom widget that allows you to use SVG images in your application.
Both located somewhere and located in the assets of your application.
You can also further optimize SVG images with a compiler.
And use optimized versions. Details can be found at the following [link](https://pub.dev/packages/flutter_svg#precompiling-and-optimizing-svgs).
      ''',
      arguments: [
        const TagArgument(
          name: 'ref',
          values: {'String', 'assets/svg_icons/star.svg', 'https://cdn.ourhost.com/svg_icons/star.svg'},
          description: 'The path to the SVG file, or the network path, URL, to the SVG file.',
        ),
        const TagArgument(
          name: 'vec',
          values: {'String', 'assets/svg_icons/star.svg.vec', 'https://cdn.ourhost.com/svg_icons/star.svg.vec'},
          description: '''
Path to a file pre-compiled into a special vector format. Details are available at this [link](https://pub.dev/packages/flutter_svg#precompiling-and-optimizing-svgs).
''',
        ),
        heightArgument(),
        widthArgument(),
        sizeArgument(),
        alignmentArgument(name: 'alignment'),
        packageArgument(),
        boxFitArgument(name: 'fit'),
        boolArgument(name: 'drawOutside'),
        clipArgument(name: 'clip'),
        boolArgument(name: 'matchTextDirection'),
        colorArgument(name: 'color'),
      ],
      properties: [
        const TagProperty(
          name: header,
          arguments: [
            TagArgument(
              name: 'name',
              values: {'String', 'Cache-Control', 'Authorization'},
            ),
            TagArgument(
              name: 'value',
              values: {'String', 'no-cache', 'eyJhbGciOiJIUzI1NiIsInR'},
            ),
          ],
          properties: [],
        ),
        TagProperty(
          name: colorFilter,
          arguments: [
            colorArgument(name: 'color'),
            blendModeArgument(name: 'mode'),
          ],
          properties: [],
        ),
      ],
    ),
    example: '''
<safeArea>
  <column>
    <svg ref="https://raw.githubusercontent.com/FortAwesome/Font-Awesome/6.x/svgs/solid/0.svg" color="green" height="50" width="50"/>
    <svg ref="https://raw.githubusercontent.com/FortAwesome/Font-Awesome/6.x/svgs/solid/1.svg" size="50">
      <prop:header name="Cache-Control" value="public"/>
      <prop:header name="ETag" value="737060cd8c284d8af7ad3082f209582d"/>
      <prop:colorFilter color="yellow" mode="color"/>
    </svg>
    <for in="{{ 2...10 }}">
      <svg ref="https://raw.githubusercontent.com/FortAwesome/Font-Awesome/6.x/svgs/solid/{{ cycle.value }}.svg" size="50"/>
    </for>
  </column>
</safeArea>
''',
    builder: (BuildContext context, WidgetTag element, RichRenderer richRenderer) {
      final SvgArguments arguments = SvgArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: richRenderer.renderChildren(context, element.children));

      if ((arguments.ref == null || arguments.ref!.isEmpty) && (arguments.vec == null || arguments.vec!.isEmpty)) {
        return null;
      }

      final bool isVector = arguments.vec != null && arguments.vec!.isNotEmpty;
      final String ref = isVector ? arguments.vec! : arguments.ref!;
      final bool isNetworkLink = ref.startsWith('http');

      ColorFilter? effectiveColorFilter = extractor.getProperty(colorFilter);

      if (effectiveColorFilter == null && arguments.color != null) {
        effectiveColorFilter = ColorFilter.mode(arguments.color!, BlendMode.srcIn);
      }

      if (isVector) {
        return SvgPicture(
          isNetworkLink
              ? NetworkBytesLoader(
                  Uri.parse(ref),
                  headers: Map.fromEntries(extractor.getProperties(header)),
                )
              : AssetBytesLoader(
                  ref,
                  packageName: arguments.package,
                ),
          height: arguments.size ?? arguments.height,
          width: arguments.size ?? arguments.width,
          alignment: arguments.alignment?.toAlignment() ?? Alignment.center,
          fit: arguments.fit ?? BoxFit.contain,
          allowDrawingOutsideViewBox: arguments.drawOutside ?? false,
          clipBehavior: arguments.clip ?? Clip.hardEdge,
          matchTextDirection: arguments.matchTextDirection ?? false,
          colorFilter: effectiveColorFilter,
        );
      }

      return SvgPicture(
        isNetworkLink
            ? SvgNetworkLoader(
                ref,
                headers: Map.fromEntries(extractor.getProperties(header)),
              )
            : SvgAssetLoader(
                ref,
                packageName: arguments.package,
              ),
        height: arguments.size ?? arguments.height,
        width: arguments.size ?? arguments.width,
        alignment: arguments.alignment?.toAlignment() ?? Alignment.center,
        fit: arguments.fit ?? BoxFit.contain,
        allowDrawingOutsideViewBox: arguments.drawOutside ?? false,
        clipBehavior: arguments.clip ?? Clip.hardEdge,
        matchTextDirection: arguments.matchTextDirection ?? false,
        colorFilter: effectiveColorFilter,
      );
    },
  );
}
