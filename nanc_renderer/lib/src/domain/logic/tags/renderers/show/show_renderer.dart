import 'package:flutter/material.dart';
import 'package:nanc_icons/nanc_icons.dart';
import 'package:tag_converter/tag_converter.dart';

import '../../documentation/documentation.dart';
import '../../rich_renderer.dart';
import '../../tag_description.dart';
import '../../tag_renderer.dart';
import '../../tools/properties_extractor.dart';
import '../../tools/widgets_compactor.dart';
import 'show_arguments.dart';

TagRenderer showRenderer() {
  return TagRenderer(
    icon: IconPack.mdi_directions_fork,
    tagType: TagType.widget,
    tag: 'show',
    description: TagDescription(
      description: '''
# Show

Show is a conditional statement that allows you to show (or hide) nested widgets. The following values can be used as `false`:
* `''` - empty string
* `0`
* `'0'`
* `'false'`
* `'no'`
* `'-'`
* `false`
* `null` - null value
* `[]` - empty arrays
* `{}` - empty maps
* `'[]'` - empty array, serialized as string
* `'{}'` - empty map, serialized as string

And everything, not from this list - will be interpreted as `true`. This means that if you want to display something by some condition, for example - to display a button only if there is a link for it (and it is not empty) - it is enough to use the condition `ifTrue="your_link"`.

Work logic:
* Children will be displayed if `ifTrue` is `true` or `ifFalse` is `false` (the logic for bringing values to `true/false` is described above).
* Children **will not** be displayed if `ifTrue` is `false` or `ifFalse` is `true` or none of the parameters are specified (equals to `null`) or both are `null` or `'null'` or `'undefined'`.

> At the moment, any computations such as `variable1 > variable2` are not supported. However, you can use classical variable substitution. For example `{{ data.someCondition }}` or `{{ page.someCondition }}`.
> 
> Future plans are to develop supported logic for conditional (and other) operators, with the ability to compute "in place" as well as logic written in Dart directly in Nanc.
''',
      arguments: [
        boolArgument(name: 'ifTrue'),
        boolArgument(name: 'ifFalse'),
        boolArgument(
            name: 'nullAsFalse',
            description: "If equal to `true` - then the absence of an `ifFalse` value, or `null` | `'null'` - will be interpreted as `false`."),
      ],
      properties: [],
    ),
    example: '''
<data showFirst="true" hideThird="false"/>

<safeArea>
  <row mainAxisAlignment="spaceBetween">
    <show ifTrue="{{ data.showFirst }}">
      <container width="50" height="50" color="#457FDA">
      </container>
    </show>
    <show ifFalse="false">
      <container width="50" height="50" color="#DA9745">
      </container>
    </show>
    <show ifFalse="{{ data.hideThird }}">
      <container width="50" height="50" color="#7BDA45">
      </container>
    </show>
    <show ifTrue="{{ data.showFirst && data.hideThird }}">
      <container width="50" height="50" color="pink">
      </container>
    </show>
  </row>
</safeArea>
''',
    builder: (BuildContext context, WidgetTag element, RichRenderer richRenderer) {
      final ShowArguments arguments = ShowArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: richRenderer.renderChildren(context, element.children));
      if (arguments.ifTrue ?? false) {
        return compactWidgets(extractor.children);
      }
      final bool nullAsFalse = arguments.nullAsFalse ?? false;
      if (nullAsFalse ? arguments.ifFalse != true : arguments.ifFalse == false) {
        return compactWidgets(extractor.children);
      }
      return null;
    },
  );
}
