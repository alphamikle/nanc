import 'package:nanc_renderer/src/domain/logic/tags/documentation/arguments/decoration_arguments.dart';
import 'package:nanc_renderer/src/domain/logic/tags/tag_description.dart';

TagProperty colorProp([String name = 'color', String description = '']) => TagProperty(
      name: name,
      arguments: [
        colorArg(),
      ],
      description: description,
      properties: [],
    );
