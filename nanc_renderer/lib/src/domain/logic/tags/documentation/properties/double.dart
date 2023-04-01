import 'package:nanc_renderer/src/domain/logic/tags/documentation/arguments/scalar_arguments.dart';
import 'package:nanc_renderer/src/domain/logic/tags/tag_description.dart';

TagProperty doubleProp(String name, [String description = '']) => TagProperty(
      name: name,
      arguments: [
        doubleArg('value'),
      ],
      description: description,
      properties: [],
    );
