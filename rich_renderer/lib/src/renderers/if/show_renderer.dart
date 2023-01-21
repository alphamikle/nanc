import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:rich_renderer/rich_renderer.dart';
import 'package:rich_renderer/src/documentation/arguments/scalar_arguments.dart';
import 'package:rich_renderer/src/renderers/if/show_arguments.dart';
import 'package:rich_renderer/src/renderers/property/mapper/properties_extractor.dart';
import 'package:rich_renderer/src/tools/widgets_compactor.dart';

TagRenderer showRenderer() {
  return TagRenderer(
    icon: IconPack.mdi_directions_fork,
    tag: 'show',
    pattern: RegExp(r'<show.*>'),
    endPattern: RegExp('</show>'),
    description: TagDescription(
      description: '''
# Show

Show is a conditional statement that allows you to show (or hide) nested widgets. The following values can be used as "true":
* '1'
* 'true'
* 1
* true
* 't'
* 'ok'
* 'yes'
* 'y'
* '+'
And everything, not from this list - will be interpreted as "false", except null and 'null' (String) values.

Work logic:
* Children will be displayed if `show` is "true" or `notShow` is "false" (the logic for bringing values to "true"/"false" is described above).
* Children **will not** be displayed if `show` is "false" or `notShow` is "true" or none of the parameters is specified or both are `null` or `'null'`.

> At the moment, any computations such as `something > some other` are not supported. However, you can use classical variable substitution. For example `{{ data(name).someCondition }}` or `{{ page.someCondition }}`, but keep in mind that the condition will only work if the value from the substitution is in the list above.
> 
> Future plans are to develop supported logic for conditional (and other) operators, with the ability to compute "in place" as well as logic written in Dart directly in Nanc.
''',
      arguments: [
        boolArg('show'),
        boolArg('notShow'),
      ],
      properties: [],
    ),
    example: '''
<data id="showCondition" needToShow="true"/>

<safeArea>
  <row mainAxisAlignment="spaceBetween">
    <show show="true">
      <container width="50" height="50" color="#457FDA">
      </container>
    </show>
    <show notShow="false">
      <container width="50" height="50" color="#DA9745">
      </container>
    </show>
    <show show="{{ data(showCondition).needToShow }}">
      <container width="50" height="50" color="#7BDA45">
      </container>
    </show>
  </row>
</safeArea>
''',
    builder: (BuildContext context, md.Element element, RichRenderer richRenderer) async {
      final ShowArguments arguments = ShowArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: await richRenderer.renderChildren(context, element.children));
      if (arguments.show ?? false) {
        return compactWidgets(extractor.children);
      }
      if (arguments.notShow == false) {
        return compactWidgets(extractor.children);
      }
      return null;
    },
  );
}
