import '../../tag_description.dart';
import '../arguments/scalar_arguments.dart';

TagProperty doubleProp(String name, [String description = '']) => TagProperty(
      name: name,
      arguments: [
        doubleArg('value'),
      ],
      description: description,
      properties: [],
    );
