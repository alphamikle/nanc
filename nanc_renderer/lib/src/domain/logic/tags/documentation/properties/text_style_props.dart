import 'package:nanc_renderer/src/domain/logic/tags/documentation/arguments/decoration_arguments.dart';
import 'package:nanc_renderer/src/domain/logic/tags/documentation/arguments/row_column_arguments.dart';
import 'package:nanc_renderer/src/domain/logic/tags/documentation/arguments/size_arguments.dart';
import 'package:nanc_renderer/src/domain/logic/tags/documentation/arguments/text_arguments.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/property/mapper/properties_list.dart';
import 'package:nanc_renderer/src/domain/logic/tags/tag_description.dart';

TagProperty textStyleProp({
  String name = textStyle,
}) {
  return TagProperty(
    name: name,
    arguments: [
      fontArg(),
      colorArg(),
      fontSizeArg(),
      heightArg(),
      fontWeightArg(),
      textDecorationArg(),
      textOverflowArg(),
      textBaselineArg(),
    ],
    properties: [],
  );
}
