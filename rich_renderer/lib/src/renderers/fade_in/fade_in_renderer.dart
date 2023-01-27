import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:rich_renderer/rich_renderer.dart';
import 'package:rich_renderer/src/documentation/arguments/animation_arguments.dart';
import 'package:rich_renderer/src/renderers/fade_in/curve_enum.dart';
import 'package:rich_renderer/src/renderers/fade_in/fade_in.dart';
import 'package:rich_renderer/src/renderers/fade_in/fade_in_arguments.dart';
import 'package:rich_renderer/src/tools/widgets_compactor.dart';

Curve? _mapCurveEnumToCurve(CurveEnum? curveEnum) {
  if (curveEnum == null) {
    return null;
  }
  const Map<CurveEnum, Curve> map = {
    CurveEnum.linear: Curves.linear,
    CurveEnum.decelerate: Curves.decelerate,
    CurveEnum.fastLinearToSlowEaseIn: Curves.fastLinearToSlowEaseIn,
    CurveEnum.ease: Curves.ease,
    CurveEnum.easeIn: Curves.easeIn,
    CurveEnum.easeInToLinear: Curves.easeInToLinear,
    CurveEnum.easeInSine: Curves.easeInSine,
    CurveEnum.easeInQuad: Curves.easeInQuad,
    CurveEnum.easeInCubic: Curves.easeInCubic,
    CurveEnum.easeInQuart: Curves.easeInQuart,
    CurveEnum.easeInQuint: Curves.easeInQuint,
    CurveEnum.easeInExpo: Curves.easeInExpo,
    CurveEnum.easeInCirc: Curves.easeInCirc,
    CurveEnum.easeInBack: Curves.easeInBack,
    CurveEnum.easeOut: Curves.easeOut,
    CurveEnum.linearToEaseOut: Curves.linearToEaseOut,
    CurveEnum.easeOutSine: Curves.easeOutSine,
    CurveEnum.easeOutQuad: Curves.easeOutQuad,
    CurveEnum.easeOutCubic: Curves.easeOutCubic,
    CurveEnum.easeOutQuart: Curves.easeOutQuart,
    CurveEnum.easeOutQuint: Curves.easeOutQuint,
    CurveEnum.easeOutExpo: Curves.easeOutExpo,
    CurveEnum.easeOutCirc: Curves.easeOutCirc,
    CurveEnum.easeOutBack: Curves.easeOutBack,
    CurveEnum.easeInOut: Curves.easeInOut,
    CurveEnum.easeInOutSine: Curves.easeInOutSine,
    CurveEnum.easeInOutQuad: Curves.easeInOutQuad,
    CurveEnum.easeInOutCubic: Curves.easeInOutCubic,
    CurveEnum.easeInOutCubicEmphasized: Curves.easeInOutCubicEmphasized,
    CurveEnum.easeInOutQuart: Curves.easeInOutQuart,
    CurveEnum.easeInOutQuint: Curves.easeInOutQuint,
    CurveEnum.easeInOutExpo: Curves.easeInOutExpo,
    CurveEnum.easeInOutCirc: Curves.easeInOutCirc,
    CurveEnum.easeInOutBack: Curves.easeInOutBack,
    CurveEnum.fastOutSlowIn: Curves.fastOutSlowIn,
    CurveEnum.slowMiddle: Curves.slowMiddle,
    CurveEnum.bounceIn: Curves.bounceIn,
    CurveEnum.bounceOut: Curves.bounceOut,
    CurveEnum.bounceInOut: Curves.bounceInOut,
    CurveEnum.elasticIn: Curves.elasticIn,
    CurveEnum.elasticOut: Curves.elasticOut,
    CurveEnum.elasticInOut: Curves.elasticInOut,
  };
  return map[curveEnum];
}

TagRenderer fadeInRenderer() {
  return TagRenderer(
    icon: IconPack.mdi_circle_opacity,
    tag: 'fadeIn',
    pattern: RegExp(r'<fadeIn.*>'),
    endPattern: RegExp('</fadeIn>'),
    description: TagDescription(
      description: '''
# Fade in

Fade in - its a special auto-animated widget, which will show its child after a some delay with "fadeIn" effect. That delay is equal to 250ms by default and possible to change by your hands.

Also, you are available to change Curve type of animation. More info about curves see in the `curve` argument description.
''',
      arguments: [
        durationArg(),
        curveArg(),
      ],
      properties: [],
    ),
    example: '''
<safeArea>
  <center>
    <fadeIn duration="1000" curve="bounceOut">
      <container size="200" color="#07B982">
      </container>
    </fadeIn>
  </center>
</safeArea>
''',
    builder: (BuildContext context, md.Element element, RichRenderer richRenderer) async {
      final FadeInArguments arguments = FadeInArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: await richRenderer.renderChildren(context, element.children));

      return FadeIn(
        duration: arguments.duration == null ? const Duration(milliseconds: 250) : Duration(milliseconds: arguments.duration!),
        curve: _mapCurveEnumToCurve(arguments.curve),
        child: compactWidgets(extractor.children),
      );
    },
  );
}
