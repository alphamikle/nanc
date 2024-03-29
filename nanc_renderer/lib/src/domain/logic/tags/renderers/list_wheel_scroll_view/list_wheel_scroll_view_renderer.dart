import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nanc_icons/nanc_icons.dart';

import '../../../../../../nanc_renderer.dart';
import 'list_wheel_scroll_view_arguments.dart';

TagRenderer listWheelScrollViewRenderer() {
  return TagRenderer(
    icon: IconPack.flu_slide_transition_regular,
    tagType: TagType.widget,
    tag: 'listWheelScrollView',
    description: TagDescription(
      description: '''
# [List Wheel Scroll View](https://api.flutter.dev/flutter/widgets/ListWheelScrollView-class.html)

A box in which children on a wheel can be scrolled.

This widget is similar to a [ListView](widgets/ListView-class.html) but with the restriction that all children must be the same size along the scrolling axis.

When the list is at the zero scroll offset, the first child is aligned with the middle of the viewport. When the list is at the final scroll offset, the last child is aligned with the middle of the viewport.

The children are rendered as if rotating on a wheel instead of scrolling on a plane.
      ''',
      arguments: [
        doubleArgument(name: 'itemExtent'),
        doubleArgument(name: 'diameterRatio'),
        doubleArgument(name: 'magnification'),
        doubleArgument(name: 'offAxisFraction'),
        doubleArgument(name: 'offAxisFraction'),
        eventArgument(name: 'onSelectedItemChanged', metaName: 'index', metaValue: 'int'),
        doubleArgument(name: 'overAndUnderCenterOpacity'),
        doubleArgument(name: 'perspective'),
        boolArgument(name: 'renderChildrenOutsideViewport'),
        doubleArgument(name: 'squeeze'),
        boolArgument(name: 'useMagnifier'),
      ],
      properties: [],
    ),
    example: '''
<safeArea/>
<sizedBox height="600">
  <listWheelScrollView itemExtent="200">
    <container height="200" width="200" color="red"/>
    <container height="200" width="200" color="blue"/>
    <container height="200" width="200" color="red"/>
    <container height="200" width="200" color="blue"/>
    <container height="200" width="200" color="red"/>
    <container height="200" width="200" color="blue"/>
    <container height="200" width="200" color="red"/>
    <container height="200" width="200" color="blue"/>
  </listWheelScrollView>
</sizedBox>
''',
    builder: (BuildContext context, WidgetTag element, RichRenderer richRenderer) {
      final ListWheelScrollViewArguments arguments = ListWheelScrollViewArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: richRenderer.renderChildren(context, element.children));

      if (extractor.children.isEmpty || arguments.itemExtent == null || arguments.itemExtent! <= 0) {
        return null;
      }

      final bool horizontal = arguments.axis == Axis.horizontal;

      List<Widget> rotatedChildren() {
        return extractor.children.map((Widget child) {
          return RotatedBox(
            quarterTurns: 1,
            child: child,
          );
        }).toList();
      }

      final Widget widget = ListWheelScrollView(
        key: (arguments.key?.isEmpty ?? true) ? null : ValueKey(arguments.key),
        itemExtent: arguments.itemExtent!,
        diameterRatio: arguments.diameterRatio ?? RenderListWheelViewport.defaultDiameterRatio,
        magnification: arguments.magnification ?? 1,
        offAxisFraction: arguments.offAxisFraction ?? 0,
        onSelectedItemChanged: (int index) async => handleEvent(
          context: context,
          event: arguments.onSelectedItemChanged,
          meta: {
            'index': index,
          },
        )?.call(),
        overAndUnderCenterOpacity: arguments.overAndUnderCenterOpacity ?? 1,
        perspective: arguments.perspective ?? RenderListWheelViewport.defaultPerspective,
        renderChildrenOutsideViewport: arguments.renderChildrenOutsideViewport ?? false,
        squeeze: arguments.squeeze ?? 1,
        useMagnifier: arguments.useMagnifier ?? false,
        controller: FixedExtentScrollController(),
        physics: const FixedExtentScrollPhysics(),
        children: horizontal ? rotatedChildren() : extractor.children,
      );
      if (horizontal) {
        return RotatedBox(
          quarterTurns: -1,
          child: widget,
        );
      }
      return widget;
    },
  );
}
