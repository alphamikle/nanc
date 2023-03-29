import 'package:rich_renderer/src/documentation/arguments/decoration_arguments.dart';
import 'package:rich_renderer/src/documentation/arguments/row_column_arguments.dart';
import 'package:rich_renderer/src/documentation/arguments/size_arguments.dart';
import 'package:rich_renderer/src/documentation/arguments/text_arguments.dart';
import 'package:rich_renderer/src/renderers/property/mapper/properties_list.dart';
import 'package:rich_renderer/src/tag_description.dart';

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
