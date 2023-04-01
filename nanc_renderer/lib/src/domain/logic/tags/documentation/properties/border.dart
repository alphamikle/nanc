import 'package:nanc_renderer/src/domain/logic/tags/documentation/arguments/decoration_arguments.dart';
import 'package:nanc_renderer/src/domain/logic/tags/documentation/arguments/size_arguments.dart';
import 'package:nanc_renderer/src/domain/logic/tags/tag_description.dart';

TagProperty borderProp([String name = 'border']) => TagProperty(
      name: name,
      arguments: [
        colorArg(),
        // strokeAlignArg(),
        widthArg(),
      ],
      properties: [],
    );
