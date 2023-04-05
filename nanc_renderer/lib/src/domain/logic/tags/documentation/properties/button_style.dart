import '../../tag_description.dart';
import '../arguments/decoration_arguments.dart';
import '../arguments/position_arguments.dart';
import '../arguments/scalar_arguments.dart';

TagProperty buttonStyleProp([String name = 'buttonStyle']) => TagProperty(
      name: name,
      arguments: [
        colorArg('backgroundColor'),
        colorArg('foregroundColor'),
        colorArg('iconColor'),
        colorArg('overlayColor'),
        colorArg('shadowColor'),
        colorArg('surfaceTintColor'),
        alignmentArg(),
        doubleArg('elevation'),
        doubleArg('iconSize'),
      ],
      properties: [],
    );
