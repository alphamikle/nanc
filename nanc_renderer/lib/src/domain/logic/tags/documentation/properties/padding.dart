import 'package:nanc_renderer/src/domain/logic/tags/documentation/arguments/padding_arguments.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/property/mapper/properties_list.dart';
import 'package:nanc_renderer/src/domain/logic/tags/tag_description.dart';

TagProperty paddingProp([String name = padding]) => TagProperty(
      name: name,
      arguments: [
        leftArg(),
        topArg(),
        rightArg(),
        bottomArg(),
        allPaddingArg(),
      ],
      properties: [],
    );
