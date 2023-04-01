import 'package:nanc_renderer/src/domain/logic/tags/documentation/arguments/position_arguments.dart';
import 'package:nanc_renderer/src/domain/logic/tags/tag_description.dart';

TagProperty alignmentProp([String name = 'alignment']) => TagProperty(
      name: name,
      arguments: [
        xArg(),
        yArg(),
        alignmentArg(),
      ],
      properties: [],
    );
