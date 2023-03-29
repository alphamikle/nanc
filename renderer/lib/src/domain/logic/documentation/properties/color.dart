import 'package:rich_renderer/src/documentation/arguments/decoration_arguments.dart';
import 'package:rich_renderer/src/tag_description.dart';

TagProperty colorProp([String name = 'color', String description = '']) => TagProperty(
      name: name,
      arguments: [
        colorArg(),
      ],
      description: description,
      properties: [],
    );
