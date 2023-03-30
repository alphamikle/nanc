import 'package:flutter/material.dart';
import 'package:icons/icons.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:rich_renderer/rich_renderer.dart';
import 'package:rich_renderer/src/renderers/if/show_arguments.dart';
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

Show is a conditional statement that allows you to show (or hide) nested widgets. The following values can be used as `false`:
* `''`
* `0`
* `'0'`
* `'false'`
* `'null'`
* `'undefined'`
* `'no'`
* `'-'`
* `false`
* `null`

And everything, not from this list - will be interpreted as `true`. This means that if you want to display something by some condition, for example - to display a button only if there is a link for it (it is not empty) - it is enough to use the condition `show="your_link"`.

Work logic:
* Children will be displayed if `show` is `true` or `notShow` is `false` (the logic for bringing values to `true/false` is described above).
* Children **will not** be displayed if `show` is `false` or `notShow` is `true` or none of the parameters is specified or both are `null` or `'null'`.

> At the moment, any computations such as `variable1 > variable2` are not supported. However, you can use classical variable substitution. For example `{{ data(name).someCondition }}` or `{{ page.someCondition }}`.
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
    builder: (BuildContext context, md.Element element, RichRenderer richRenderer) {
      final ShowArguments arguments = ShowArguments.fromJson(element.attributes);
      final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: richRenderer.renderChildren(context, element.children));
      if (element.attributes['id'] == 'test') {
        print(1);
      }
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
