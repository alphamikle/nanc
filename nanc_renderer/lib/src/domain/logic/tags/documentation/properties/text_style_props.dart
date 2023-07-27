import '../../tag_description.dart';
import '../../tools/properties_names.dart';
import '../arguments/decoration_arguments.dart';
import '../arguments/row_column_arguments.dart';
import '../arguments/size_arguments.dart';
import '../arguments/text_arguments.dart';

TagProperty textStyleProp({String name = textStyle}) {
  return TagProperty(
    name: name,
    arguments: [
      fontArgument(),
      colorArgument(name: 'color'),
      fontSizeArgument(),
      heightArgument(),
      fontWeightArgument(),
      textDecorationArgument(),
      textOverflowArgument(),
      textBaselineArgument(),
    ],
    properties: [],
  );
}
