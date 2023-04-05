import '../../tag_description.dart';
import '../arguments/decoration_arguments.dart';
import 'alignment.dart';
import 'color.dart';
import 'double.dart';

TagProperty gradientProp([String name = 'gradient']) => TagProperty(
      name: name,
      arguments: [
        tileModeArg(),
      ],
      properties: [
        colorProp('color', '''
Several `<prop:color>` can be specified, each with its own value.
For example:
```
<prop:gradient>
  <prop:color color="#D18325"/>
  <prop:color color="#AF25D15D"/>
  <prop:color color="#9125D1"/>
</prop:gradient>
```
'''),
        doubleProp('stop', '''
Several `<prop:stop>` can be specified, each with its own value.
For example:
```
<prop:gradient>
  <prop:stop value="0.25"/>
  <prop:stop value="0.5"/>
  <prop:stop value="0.75"/>
</prop:gradient>
```
'''),
        alignmentProp('begin'),
        alignmentProp('end'),
      ],
    );
