import 'package:nanc_renderer/src/domain/logic/tags/documentation/arguments/decoration_arguments.dart';
import 'package:nanc_renderer/src/domain/logic/tags/documentation/properties/border.dart';
import 'package:nanc_renderer/src/domain/logic/tags/documentation/properties/border_radius.dart';
import 'package:nanc_renderer/src/domain/logic/tags/documentation/properties/gradient.dart';
import 'package:nanc_renderer/src/domain/logic/tags/documentation/properties/shadow.dart';
import 'package:nanc_renderer/src/domain/logic/tags/renderers/property/mapper/properties_list.dart';
import 'package:nanc_renderer/src/domain/logic/tags/tag_description.dart';

TagProperty boxDecorationProp([String name = 'decoration']) => TagProperty(
      name: name,
      arguments: [
        colorArg(),
        blendModeArg('backgroundBlendMode'),
      ],
      properties: [
        borderRadiusProp(),
        borderProp(),
        shadowProp(shadow),
        gradientProp(),
      ],
    );
