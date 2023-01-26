import 'package:rich_renderer/src/documentation/arguments/decoration_arguments.dart';
import 'package:rich_renderer/src/documentation/arguments/size_arguments.dart';
import 'package:rich_renderer/src/tag_description.dart';

TagProperty borderProp([String name = 'border']) => TagProperty(
      name: name,
      arguments: [
        colorArg(),
        // strokeAlignArg(),
        widthArg(),
      ],
      properties: [],
    );
