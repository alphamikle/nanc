import '../../renderers/property/mapper/properties_list.dart';
import '../../tag_description.dart';
import '../arguments/padding_arguments.dart';

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
