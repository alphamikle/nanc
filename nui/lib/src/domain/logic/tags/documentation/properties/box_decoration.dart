import '../../tag_description.dart';
import '../arguments/decoration_arguments.dart';
import 'border.dart';
import 'border_radius.dart';
import 'gradient.dart';
import 'shadow.dart';

TagProperty boxDecorationProp({String name = 'decoration'}) => TagProperty(
      name: name,
      arguments: [
        colorArgument(name: 'color'),
        blendModeArgument(name: 'backgroundBlendMode'),
      ],
      properties: [
        borderRadiusProp(),
        borderProp(),
        shadowProp(name: 'shadow'),
        gradientProp(),
      ],
    );
