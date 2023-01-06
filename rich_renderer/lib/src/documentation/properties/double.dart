import 'package:rich_renderer/src/documentation/arguments/scalar_arguments.dart';
import 'package:rich_renderer/src/tag_description.dart';

TagProperty doubleProp(String name, [String description = '']) => TagProperty(
      name: name,
      arguments: [
        doubleArg('value'),
      ],
      description: description,
      properties: [],
    );
