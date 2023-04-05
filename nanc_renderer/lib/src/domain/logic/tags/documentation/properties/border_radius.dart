import '../../tag_description.dart';
import '../arguments/border_radius_arguments.dart';

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
