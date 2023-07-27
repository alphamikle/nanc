import '../../tag_description.dart';
import '../arguments/decoration_arguments.dart';
import '../arguments/position_arguments.dart';
import '../arguments/scalar_arguments.dart';

TagProperty buttonStyleProp({String name = 'buttonStyle'}) => TagProperty(
      name: name,
      arguments: [
        colorArgument(name: 'backgroundColor'),
        colorArgument(name: 'foregroundColor'),
        colorArgument(name: 'iconColor'),
        colorArgument(name: 'overlayColor'),
        colorArgument(name: 'shadowColor'),
        colorArgument(name: 'surfaceTintColor'),
        alignmentArgument(name: 'align'),
        doubleArgument(name: 'elevation'),
        doubleArgument(name: 'iconSize'),
      ],
      properties: [],
    );
