import '../../tag_description.dart';
import '../arguments/position_arguments.dart';

TagProperty alignmentProp([String name = 'alignment']) => TagProperty(
      name: name,
      arguments: [
        xArg(),
        yArg(),
        alignmentArg(),
      ],
      properties: [],
    );
