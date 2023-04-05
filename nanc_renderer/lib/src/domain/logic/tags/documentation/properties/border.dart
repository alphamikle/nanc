import '../../tag_description.dart';
import '../arguments/decoration_arguments.dart';
import '../arguments/size_arguments.dart';

TagProperty borderProp([String name = 'border']) => TagProperty(
      name: name,
      arguments: [
        colorArg(),
        // strokeAlignArg(),
        widthArg(),
      ],
      properties: [],
    );
