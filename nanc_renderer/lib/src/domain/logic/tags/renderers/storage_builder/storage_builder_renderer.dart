import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons/icons.dart';
import 'package:tools/tools.dart';

import '../../../../../../nanc_renderer.dart';
import '../../tools/chain_extractor.dart';
import '../../tools/widgets_compactor.dart';
import 'storage_builder_arguments.dart';

TagRenderer storageBuilderRenderer() {
  return TagRenderer(
    icon: IconPack.flu_access_time_filled,
    tagType: TagType.widget,
    tag: 'storageBuilder',
    description: TagDescription(
      description: '''
# Storage Builder
      ''',
      arguments: [
        // TODO(alphamikle): arguments docs
      ],
      properties: [
        // TODO(alphamikle): properties docs
      ],
    ),
    example: '''
TODO
''',
    builder: (BuildContext context, WidgetTag element, RichRenderer richRenderer) {
      final StorageBuilderArguments arguments = StorageBuilderArguments.fromJson(element.attributes);

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
