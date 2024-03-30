import 'package:flutter/material.dart';

import '../data_storage.dart';
import '../events/event_handler.dart';
import '../events/model/event.dart';

final RegExp _updateRegExp = RegExp(r'^emit:(?<valueId>.*)$');

EventHandler dataStorageEventHandler = EventHandler(
  test: (BuildContext context, Event event) => _updateRegExp.hasMatch(event.event),
  handler: (BuildContext context, Event event) {
    final DataStorage dataStorage = DataStorage.of(context);

    if (event.meta == Event.defaultMetaInfo) {
      return;
    }

    final String key = _updateRegExp.firstMatch(event.event)!.namedGroup('valueId')!;

    if (event.meta?.length == 1) {
      dataStorage.updateValue(key, event.meta!.values.first);
    } else {
      dataStorage.updateValue(key, event.meta);
    }
  },
);
