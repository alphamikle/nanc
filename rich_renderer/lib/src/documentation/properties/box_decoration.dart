import 'package:rich_renderer/src/documentation/arguments/decoration_arguments.dart';
import 'package:rich_renderer/src/documentation/properties/border.dart';
import 'package:rich_renderer/src/documentation/properties/border_radius.dart';
import 'package:rich_renderer/src/documentation/properties/gradient.dart';
import 'package:rich_renderer/src/documentation/properties/shadow.dart';
import 'package:rich_renderer/src/tag_description.dart';

TagProperty boxDecorationProp([String name = 'boxDecoration']) => TagProperty(
      name: name,
      arguments: [
        colorArg(),
        blendModeArg('backgroundBlendMode'),
      ],
      properties: [
        borderRadiusProp(),
        borderProp(),
        shadowProp('boxShadow'),
        gradientProp(),
      ],
    );
