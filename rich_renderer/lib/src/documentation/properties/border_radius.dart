import 'package:rich_renderer/src/documentation/arguments/padding_arguments.dart';
import 'package:rich_renderer/src/tag_description.dart';

TagProperty borderRadiusProp([String name = 'borderRadius']) => TagProperty(
      name: name,
      arguments: [
        topLeftArg(),
        topRightArg(),
        bottomRightArg(),
        bottomLeftArg(),
        allArg(),
      ],
      properties: [],
    );
