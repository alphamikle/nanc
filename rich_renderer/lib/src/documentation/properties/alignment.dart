import 'package:rich_renderer/rich_renderer.dart';

TagProperty alignmentProp([String name = 'alignment']) => TagProperty(
      name: name,
      arguments: [
        xArg(),
        yArg(),
        alignmentArg(),
      ],
      properties: [],
    );
