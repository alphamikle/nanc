import 'package:rich_renderer/src/documentation/arguments/padding_arguments.dart';
import 'package:rich_renderer/src/renderers/property/mapper/properties_list.dart';
import 'package:rich_renderer/src/tag_description.dart';

TagProperty paddingProp([String name = padding]) => TagProperty(
      name: name,
      arguments: [
        leftArg(),
        topArg(),
        rightArg(),
        bottomArg(),
        allPaddingArg(),
      ],
      properties: [],
    );
