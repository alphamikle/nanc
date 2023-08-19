import 'package:flutter/material.dart';
import 'package:icons/icons.dart';

import '../../../model/tag.dart';
import '../../documentation/documentation.dart';
import '../../logic/data_storage.dart';
import '../../rich_renderer.dart';
import '../../tag_description.dart';
import '../../tag_renderer.dart';
import 'data_arguments.dart';

TagRenderer dataRenderer() {
  return TagRenderer(
    icon: IconPack.mdi_code_json,
    tagType: TagType.other,
    tag: 'data',
    description: TagDescription(
      description: '''
# Data

Data - is a special tag, which allows you to store any data in the `DataStorage`! It may be helpful, for example, if you have some reusable param, which need in many places of your UI.

`<data>` accepts any arguments, where the argument name is the name of the key and the value is the corresponding value of the given key.

For example, a declaration of the following form:

```html
<data user.age="30" user.name="Mike"/>
```

is equal to creating the following structure in the global data store:

```json
{
  "user": {
    "age": "30",
    "name": "Mike"
  }
}
```

Note that all values will be strings, even if you specify numbers, boolean parameters, and so on.
However, if the consumer of this data will be widgets/tags included in Nanc - this will not be a problem,
because each of them is able to cast to the appropriate type of any argument used independently.
And realizations of your own widgets/tags are your responsibility, where you can do everything the same way,
including using functions included in Nanc that allow you to do it without writing code, for example - `nullableIntFromJson`, etc.

In addition to this, the `<data>` tag has an optional `namespace` parameter which, if given and not equal to an empty string, will be a prefix for all specified attributes of a particular tag. Thus, the next two entries will be identical to each other:

```html
<data namespace="user" age="30" name="Mike"/>
<data user.age="30" user.name="Mike"/>

<data namespace="properties.color" primary="red" secondary="green" tertiary="blue"/>
<data properties.color.primary="red" properties.color.secondary="green" properties.color.tertiary="blue"/>
```
''',
      arguments: [
        stringArgument(name: 'namespace'),
        anyArgument(),
      ],
      properties: [],
    ),
    example: r'''
<data gap.left="36" gap.top="36" gap.right="36" gap.bottom="36"/>

<data namespace="props.colors" primary="red" secondary="green" tertiary="blue"/>

<container width="300" height="500" color="{{ data.props.colors.tertiary }}">
  <prop:padding left="{{ data.gap.left }}" top="{{ data.gap.top }}" right="{{ data.gap.right }}" bottom="{{ data.gap.bottom }}"/>
  <container color="{{ data.props.colors.primary }}">
    <prop:padding left="{{ data.gap.left }}" top="{{ data.gap.top }}" right="{{ data.gap.right }}" bottom="{{ data.gap.bottom }}"/>
    <container color="{{ data.props.colors.secondary }}">
      <prop:padding left="{{ data.gap.left }}" top="{{ data.gap.top }}" right="{{ data.gap.right }}" bottom="{{ data.gap.bottom }}"/>
      <container color="{{ data.props.colors.tertiary }}">
        <prop:padding left="{{ data.gap.left }}" top="{{ data.gap.top }}" right="{{ data.gap.right }}" bottom="{{ data.gap.bottom }}"/>
        <container color="{{ data.props.colors.primary }}">
          <prop:padding left="{{ data.gap.left }}" top="{{ data.gap.top }}" right="{{ data.gap.right }}" bottom="{{ data.gap.bottom }}"/>
          <container color="{{ data.props.colors.secondary }}">
            <prop:padding left="{{ data.gap.left }}" top="{{ data.gap.top }}" right="{{ data.gap.right }}" bottom="{{ data.gap.bottom }}"/>
          </container>
        </container>
      </container>
    </container>
  </container>
</container>
''',
    builder: (BuildContext context, WidgetTag element, RichRenderer richRenderer) {
      final DataArguments arguments = DataArguments.fromJson(element.attributes);
      final Map<String, String> newArguments = {...element.attributes};
      final String? namespace = arguments.namespace;
      final bool withNamespace = namespace != null && namespace.isNotEmpty;
      if (withNamespace) {
        newArguments.remove(DataArguments.namespaceAttributeName);
      }

      final DataStorage dataStorage = DataStorage.of(context);
      for (final MapEntry(:key, :value) in newArguments.entries) {
        final String finalKey;
        if (withNamespace) {
          finalKey = '$namespace.$key';
        } else {
          finalKey = key;
        }
        dataStorage.updateValue(finalKey, value);
      }

      return null;
    },
  );
}
