import 'package:rich_renderer/rich_renderer.dart';

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
