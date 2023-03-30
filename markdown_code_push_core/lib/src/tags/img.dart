import 'package:flutter/material.dart';
import 'package:markdown/markdown.dart' as m;

import 'package:markdown_code_push_core/src/config/style_config.dart';

///Tag: img
InlineSpan getImageSpan(m.Element node) {
  String? url = node.attributes['src'];
  return WidgetSpan(
    child: ImageTagWidget(attributes: node.attributes, url: url),
  );
}

///the image widget
class ImageTagWidget extends StatelessWidget {

  const ImageTagWidget({
    super.key,
    required this.attributes,
    this.url,
  });
  final Map<String, String> attributes;
  final String? url;

  @override
  Widget build(BuildContext context) {
    double? width;
    double? height;
    if (attributes['width'] != null) width = double.parse(attributes['width']!);
    if (attributes['height'] != null) height = double.parse(attributes['height']!);
    final imageUrl = url ?? attributes['src']!;
    final image = Image.network(
      imageUrl,
      width: width,
      height: height,
      fit: BoxFit.cover,
    );
    final config = StyleConfig().imgConfig;
    return StyleConfig().imgBuilder?.call(imageUrl, attributes) ?? config?.imgWrapper?.call(image) ?? image;
  }
}

///config class for [ImageTagWidget]
class ImgConfig {

  ImgConfig({this.imgWrapper});
  final ImgWrapper? imgWrapper;
}

typedef ImgBuilder = Widget Function(String url, Map<String, String> attributes);
typedef ImgWrapper = Widget Function(Widget img);
