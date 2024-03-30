import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nanc_icons/nanc_icons.dart';
import 'package:nanc_tools/nanc_tools.dart';

import '../../../../../../nanc_renderer.dart';
import '../../tools/chain_extractor.dart';
import '../../tools/widgets_compactor.dart';
import 'data_builder_arguments.dart';

TagRenderer dataBuilderRenderer() {
  return TagRenderer(
    icon: IconPack.mdi_file_document_refresh,
    tagType: TagType.widget,
    tag: 'dataBuilder',
    description: TagDescription(
      description: '''
# Data Builder

This is a special widget/tag that you can use to dynamically update the interface created with NUI based on data changes.

For example, in your `DataStorage` you have some object - user:
```json
{
  // ...other data structures
  "user": {
    "isAuthorized": true,
    "name": "Mike",
    "age": 29
  }
}
```

And in this example, the value of the `isAuthorized` field has changed to `false`.
And you also have some sort of widget/tag (or a subtree of them) that depend on this field in the data.
In this case, you can change only this subtree, and `dataBuilder` will help you in this:

```html
<dataBuilder buildWhen="user.isAuthorized">
  <show ifTrue="{{ data.user.isAuthorized }}">
    <text text="Hello {{ data.user.name }}!"/>
  </show>
  <show ifFalse="{{ data.user.isAuthorized }}">
    <text text="Hello user"/>
  </show>
</dataBuilder>
```

You can build the following logic chains to update your UI only when specific data changes:

- `buildAlways="true"` - your UI defined inside `<dataStorage>` will be updated when any `DataStorage` field - whether nested or not - is updated
- `buildWhen="someKey.which.can.be.semi"` - the key of the value located in `DataStorage`. If the value available by this key - changes, the UI subtree will be updated
- `orWhen="some.another.key"` - the key of an additional value, changing the value corresponding to it forms the following logic: * update the interface if `buildWhen` value is updated or `orWhen` value is updated.
- `andWhen="some.another.another.key"` - value key, changing it will change our UI only if the value (`buildwhen` or `orWhen` value) and `andWhen` have changed.
      ''',
      arguments: [
        boolArgument(name: 'buildAlways'),
        stringArgument(name: 'buildWhen'),
        stringArgument(name: 'orWhen'),
        stringArgument(name: 'andWhen'),
        eventArgument(name: 'onUpdate', metaName: 'state', metaValue: 'String with corresponding deserialized DataStorage state'),
      ],
      properties: [],
    ),
    example: '''
<data namespace="user" isAuthorized="true" name="Mike" age="29"/>

<safeArea/>

<dataBuilder buildWhen="user.isAuthorized">
  <show ifTrue="{{ data.user.isAuthorized }}">
    <text text="Hello {{ data.user.name }}!"/>
  </show>
  <show ifFalse="{{ data.user.isAuthorized }}">
    <text text="Hello user"/>
  </show>
</dataBuilder>

<dataBuilder buildWhen="user.isAuthorized">
  <row>
    <text text="User authorized:"/>
    <switch value="{{ data.user.isAuthorized }}" onChanged="emit:user.isAuthorized"/>
  </row>
</dataBuilder>
''',
    builder: (BuildContext context, WidgetTag element, RichRenderer richRenderer) {
      final DataBuilderArguments arguments = DataBuilderArguments.fromJson(element.attributes);

      final Widget builder = BlocBuilder<DataStorage, Json>(
        buildWhen: (Json previous, Json current) {
          if (arguments.buildAlways ?? false) {
            return true;
          }
          bool needToUpdate = false;
          if (arguments.buildWhen?.isNotEmpty ?? false) {
            final List<String> keychain = arguments.buildWhen!.split('.');
            needToUpdate = extractValueByChain(previous, keychain) != extractValueByChain(current, keychain);
          }
          if (needToUpdate && (arguments.andWhen?.isNotEmpty ?? false)) {
            final List<String> keychain = arguments.andWhen!.split('.');
            needToUpdate = extractValueByChain(previous, keychain) != extractValueByChain(current, keychain);
          }
          if (arguments.orWhen?.isNotEmpty ?? false) {
            final List<String> keychain = arguments.orWhen!.split('.');
            needToUpdate = needToUpdate || extractValueByChain(previous, keychain) != extractValueByChain(current, keychain);
          }
          return needToUpdate;
        },
        builder: (BuildContext context, Json state) {
          final PropertiesExtractor extractor = PropertiesExtractor(context: context, rawChildren: richRenderer.renderChildren(context, element.children));
          return compactWidgets(extractor.children);
        },
      );
      if (arguments.onUpdate?.isNotEmpty ?? false) {
        return BlocListener<DataStorage, Json>(
          listener: (BuildContext context, Json state) async => handleEvent(
            context: context,
            event: arguments.onUpdate,
            meta: {
              'state': jsonEncode(state),
            },
          )?.call(),
          child: builder,
        );
      }
      return builder;
    },
  );
}
