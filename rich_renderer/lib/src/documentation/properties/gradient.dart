import 'package:rich_renderer/rich_renderer.dart';
import 'package:rich_renderer/src/documentation/arguments/decoration_arguments.dart';
import 'package:rich_renderer/src/documentation/properties/alignment.dart';
import 'package:rich_renderer/src/documentation/properties/color.dart';
import 'package:rich_renderer/src/documentation/properties/double.dart';

TagProperty gradientProp([String name = 'gradient']) => TagProperty(
      name: name,
      arguments: [
        tileModeArg(),
      ],
      properties: [
        colorProp(),
        doubleProp('stop'),
        alignmentProp('begin'),
        alignmentProp('end'),
      ],
    );
