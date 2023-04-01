import 'package:nanc_renderer/src/domain/logic/tags/documentation/arguments/border_radius_arguments.dart';
import 'package:nanc_renderer/src/domain/logic/tags/tag_description.dart';

TagProperty borderRadiusProp([String name = 'borderRadius']) => TagProperty(
      name: name,
      arguments: [
        topLeftArg(),
        topRightArg(),
        bottomRightArg(),
        bottomLeftArg(),
        allArg(),
      ],
      properties: [],
    );
