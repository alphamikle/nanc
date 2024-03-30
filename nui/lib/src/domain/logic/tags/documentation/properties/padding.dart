import '../../tag_description.dart';
import '../../tools/properties_names.dart';
import '../arguments/padding_arguments.dart';

TagProperty paddingProp({String name = padding}) => TagProperty(
      name: name,
      arguments: [
        leftArgument(),
        topArgument(),
        rightArgument(),
        bottomArgument(),
        allPaddingArgument(),
      ],
      properties: [],
    );
