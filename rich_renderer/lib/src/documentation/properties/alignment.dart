import 'package:rich_renderer/rich_renderer.dart';
import 'package:rich_renderer/src/documentation/arguments/position_arguments.dart';
import 'package:rich_renderer/src/documentation/arguments/scalar_arguments.dart';

TagProperty alignmentProp([String name = 'alignment']) => TagProperty(
      name: name,
      arguments: [
        doubleArg('x'),
        doubleArg('y'),
        alignmentArg(),
      ],
      properties: [],
    );
