import 'package:rich_renderer/rich_renderer.dart';
import 'package:rich_renderer/src/documentation/arguments/position_arguments.dart';

TagProperty alignmentProp([String name = 'alignment']) => TagProperty(
      name: name,
      arguments: [
        xArg(),
        yArg(),
        alignmentArg(),
      ],
      properties: [],
    );
