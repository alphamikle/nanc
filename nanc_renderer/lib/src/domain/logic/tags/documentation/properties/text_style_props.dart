import '../../tag_description.dart';
import '../../tools/properties_names.dart';
import '../arguments/decoration_arguments.dart';
import '../arguments/row_column_arguments.dart';
import '../arguments/size_arguments.dart';
import '../arguments/text_arguments.dart';

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
