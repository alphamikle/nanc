import 'package:rich_renderer/src/documentation/arguments/scalar.dart';
import 'package:rich_renderer/src/tag_description.dart';

TagProperty doubleProp(String name) => TagProperty(
      name: name,
      arguments: [
        doubleArg('value'),
      ],
      properties: [],
    );
