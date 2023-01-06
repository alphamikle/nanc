import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:rich_renderer/rich_renderer.dart';
import 'package:rich_renderer/src/documentation/arguments/decoration_arguments.dart';
import 'package:rich_renderer/src/documentation/arguments/position_arguments.dart';
import 'package:rich_renderer/src/documentation/arguments/scalar_arguments.dart';
import 'package:rich_renderer/src/documentation/arguments/size_arguments.dart';
import 'package:rich_renderer/src/renderers/image/image_arguments.dart';
import 'package:rich_renderer/src/renderers/image/smart_image.dart';

TagRenderer imageRenderer() {
  return TagRenderer(
    icon: IconPack.flu_image_filled,
    tag: 'image',
    pattern: RegExp(r'<image.*/>'),
    endPattern: null,
    description: TagDescription(
      description: '''
# [Image](https://api.flutter.dev/flutter/widgets/Image-class.html)

A widget that displays an image.

The following image formats are supported: JPEG, PNG, GIF, Animated GIF, WebP, Animated WebP, BMP, and WBMP. Additional formats may be supported by the underlying platform. Flutter will attempt to call platform API to decode unrecognized formats, and if the platform API supports decoding the image Flutter will be able to render it.

To automatically perform pixel-density-aware asset resolution, specify the image using an [AssetImage](painting/AssetImage-class.html) and make sure that a [MaterialApp](material/MaterialApp-class.html), [WidgetsApp](widgets/WidgetsApp-class.html), or [MediaQuery](widgets/MediaQuery-class.html) widget exists above the [Image](widgets/Image-class.html) widget in the widget tree.

The image is painted using [paintImage](painting/paintImage.html), which describes the meanings of the various fields on this class in more detail.
''',
      arguments: [
        stringArg('ref'),
        heightArg(),
        widthArg(),
        boxFitArg(),
        colorArg(),
      ],
      properties: [],
    ),
    example: '''
<safeArea>
  <column crossAxisAlignment="stretch">
    <container height="250" color="#457FDA">
      <image ref="https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg" fit="fill"/>
    </container>
    <divider height="50"/>
    
    <container height="250" color="#457FDA">
      <image ref="https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg" fit="contain"/>
    </container>
    <divider height="50"/>
    
    <container height="250" color="#457FDA">
      <image ref="https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg" fit="cover"/>
    </container>
    <divider height="50"/>
    
    <container height="250" color="#457FDA">
      <image ref="https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg" fit="fitWidth"/>
    </container>
    <divider height="50"/>
    
    <container height="250" color="#457FDA">
      <image ref="https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg" fit="fitHeight"/>
    </container>
    <divider height="50"/>
    
    <container height="250" color="#457FDA">
      <image ref="https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg" fit="none"/>
    </container>
    <divider height="50"/>
    
    <container height="250" color="#457FDA">
      <image ref="https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg" fit="scaleDown"/>
    </container>
    <divider height="50"/>
    
    <container height="250" color="#457FDA">
      <image ref="https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg" color="#6F7BDA45" width="50"/>
    </container>
    <divider height="50"/>
  </column>
</safeArea>
''',
    builder: (BuildContext context, md.Element element, RichRenderer richRenderer) async {
      final ImageArguments arguments = ImageArguments.fromJson(element.attributes);

      if (arguments.ref == null || arguments.ref!.isEmpty) {
        return const SizedBox.shrink();
      }

      return SmartImage(
        ref: arguments.ref!,
        fit: arguments.fit,
        height: arguments.height,
        width: arguments.width,
        color: arguments.color,
      );
    },
  );
}
