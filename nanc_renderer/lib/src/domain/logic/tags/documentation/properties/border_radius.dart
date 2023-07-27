import '../../tag_description.dart';
import '../arguments/border_radius_arguments.dart';

TagProperty borderRadiusProp({String name = 'borderRadius'}) => TagProperty(
      name: name,
      arguments: [
        topLeftArgument(),
        topRightArgument(),
        bottomRightArgument(),
        bottomLeftArgument(),
        allArgument(),
      ],
      properties: [],
    );
