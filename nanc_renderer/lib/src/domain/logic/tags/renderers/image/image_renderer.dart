import 'package:flutter/material.dart';
import 'package:flutter_blurhash/src/blurhash.dart';
import 'package:icons/icons.dart';
import 'package:tools/tools.dart';

import '../../../model/tag.dart';
import '../../documentation/documentation.dart';
import '../../rich_renderer.dart';
import '../../tag_description.dart';
import '../../tag_renderer.dart';
import 'image_arguments.dart';
import 'smart_image.dart';

TagRenderer imageRenderer() {
  return TagRenderer(
    icon: IconPack.flu_image_filled,
    tagType: TagType.widget,
    tag: 'image',
    description: TagDescription(
      description: '''
# [Image](https://api.flutter.dev/flutter/widgets/Image-class.html)

A widget that displays an image.

The following image formats are supported: JPEG, PNG, GIF, Animated GIF, WebP, Animated WebP, BMP, and WBMP. Additional formats may be supported by the underlying platform. Flutter will attempt to call platform API to decode unrecognized formats, and if the platform API supports decoding the image Flutter will be able to render it.

To automatically perform pixel-density-aware asset resolution, specify the image using an [AssetImage](painting/AssetImage-class.html) and make sure that a [MaterialApp](material/MaterialApp-class.html), [WidgetsApp](widgets/WidgetsApp-class.html), or [MediaQuery](widgets/MediaQuery-class.html) widget exists above the [Image](widgets/Image-class.html) widget in the widget tree.

The image is painted using [paintImage](painting/paintImage.html), which describes the meanings of the various fields on this class in more detail.

Also, if you passed a some image url and don't see the image in the Nanc, potentially you have a problem with CORS and to find a solution, please, go here: https://docs.flutter.dev/development/platform-integration/web/web-images
''',
      arguments: [
        stringArgument(name: 'ref'),
        stringArgument(name: 'blurHash', description: '''
> ### Blur hash
> 
> Blur hash is a technology, which allows you to create a very lightweight preview of your image and use it as a pre-loader for the image during the loading time.
> 
> You can pass that hash as a separated argument into the tag, with name `blurHash`, or use query parameter `bh` for the image url within the `ref` argument.
> 
> For example:
> ```
> <image blurHash="LEHV6nWB2yk8pyo0adR*.7kCMdnj" ref="here_is_your_image_url"/>
> ```
> 
> or
> ```
> <image ref="https://cdn.com/some_image_url.jpg?bh=LEHV6nWB2yk8pyo0adR%2A.7kCMdnj"/>
> ```
> In the second example blur hash is url-encoded (to understand, what is url-encoding, you can move here: https://www.urlencoder.org)
> 
> For addition info about blur hash, go here: https://blurha.sh/ or here: https://pub.dev/packages/flutter_blurhash
'''),
        heightArgument(),
        widthArgument(),
        boxFitArgument(name: 'fit'),
        colorArgument(name: 'color'),
        boolArgument(name: 'useCache'),
      ],
      properties: [],
    ),
    example: '''
<safeArea>
  <column crossAxisAlignment="stretch">
    <container height="250" color="#457FDA">
      <image ref="https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg" useCache="false" fit="fill"/>
    </container>
    <divider height="50"/>
    
    <container height="250" color="#457FDA">
      <image ref="https://flutter.github.io/assets-for-api-docs/assets/widgets/puffin.jpg" blurHash="L3G[TBtA00-h00VF-?58*0?b+uE2" fit="contain"/>
    </container>
    <divider height="50"/>
    
    <container height="250" color="#457FDA">
      <image ref="https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg?bh=L3G%5BTBtA00-h00VF-%3F58%2A0%3Fb%2BuE2" fit="cover"/>
    </container>
    <divider height="50"/>
    
    <container height="250" color="#457FDA">
      <image ref="https://flutter.github.io/assets-for-api-docs/assets/widgets/puffin.jpg" fit="fitWidth"/>
    </container>
    <divider height="50"/>
    
    <container height="250" color="#457FDA">
      <image ref="https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg" fit="fitHeight"/>
    </container>
    <divider height="50"/>
    
    <container height="250" color="#457FDA">
      <image ref="https://flutter.github.io/assets-for-api-docs/assets/widgets/puffin.jpg" fit="none"/>
    </container>
    <divider height="50"/>
    
    <container height="250" color="#457FDA">
      <image ref="https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg" fit="scaleDown"/>
    </container>
    <divider height="50"/>
    
    <container height="250" color="#457FDA">
      <image ref="https://flutter.github.io/assets-for-api-docs/assets/widgets/puffin.jpg" color="#6F7BDA45" width="50"/>
    </container>
    <divider height="50"/>
  </column>
</safeArea>
''',
    builder: (BuildContext context, WidgetTag element, RichRenderer richRenderer) {
      final ImageArguments arguments = ImageArguments.fromJson(element.attributes);
      final RegExp blurHashRegExp = RegExp(r'[?|&]?bh=(?<hash>[^&]+)');

      if (arguments.ref == null || arguments.ref!.isEmpty) {
        return null;
      }

      final Uri uri = Uri.parse(arguments.ref!);
      bool isUrlEncoded = false;
      String? blurHash = arguments.blurHash;
      if (blurHash == null) {
        isUrlEncoded = true;
        blurHash = uri.queryParameters['bh'];
      }
      if (blurHash == null) {
        final RegExpMatch? match = blurHashRegExp.firstMatch(arguments.ref!);
        if (match != null) {
          blurHash = match.namedGroup('hash');
        }
      }
      if (isUrlEncoded && blurHash != null) {
        blurHash = Uri.decodeComponent(blurHash);
      }

      if (blurHash != null && blurHash != '' && blurHash != 'null') {
        final bool isCorrectHash = validateBlurhash(blurHash);
        if (isCorrectHash == false) {
          blurHash = null;
          logWarning('Blur hash is incorrect');
        }
      }

      final String imageUrl = arguments.ref!.replaceFirst(blurHashRegExp, '');

      return SmartImage(
        key: (arguments.key?.isEmpty ?? true) ? null : ValueKey(arguments.key),
        ref: imageUrl,
        fit: arguments.fit,
        height: arguments.height,
        width: arguments.width,
        color: arguments.color,
        blurHash: blurHash,
        useCache: arguments.useCache,
      );
    },
  );
}
