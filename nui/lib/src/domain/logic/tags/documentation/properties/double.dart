import '../../tag_description.dart';
import '../arguments/scalar_arguments.dart';

TagProperty doubleProp({required String name, String description = ''}) => TagProperty(
      name: name,
      arguments: [
        doubleArgument(name: 'value'),
      ],
      description: description,
      properties: [],
    );
