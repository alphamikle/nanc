import 'package:nanc_renderer/src/domain/logic/tags/documentation/arguments/decoration_arguments.dart';
import 'package:nanc_renderer/src/domain/logic/tags/documentation/arguments/position_arguments.dart';
import 'package:nanc_renderer/src/domain/logic/tags/documentation/arguments/scalar_arguments.dart';
import 'package:nanc_renderer/src/domain/logic/tags/tag_description.dart';

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
