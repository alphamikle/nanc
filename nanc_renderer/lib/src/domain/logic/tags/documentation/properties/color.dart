import '../../tag_description.dart';
import '../arguments/decoration_arguments.dart';

TagProperty colorProp([String name = 'color', String description = '']) => TagProperty(
      name: name,
      arguments: [
        colorArg(),
      ],
      description: description,
      properties: [],
    );
