import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:tools/tools.dart';

import 'settings_state.dart';

const String _kTablesWidths = 'table_widths';

class SettingsBloc extends Cubit<SettingsState> {
  SettingsBloc({
    required this.dbService,
  }) : super(SettingsState.empty());

  final DbService dbService;

  void saveWidth({
    required String modelId,
    required TableWidth widths,
  }) {
    Debouncer.run(id: 'saveWidth:$modelId', () async {
      final TablesWidths tablesWidths = _convertDynamicMapToTablesWidths(state.tablesWidths);
      tablesWidths[modelId] = widths;
      await dbService.save(key: _kTablesWidths, value: tablesWidths);
      emit(state.copyWith(tablesWidths: tablesWidths));
    });
  }

  Future<void> preloadSettings() async {
    final DJson? tablesWidths = await dbService.get(_kTablesWidths);
    if (tablesWidths != null) {
      emit(state.copyWith(tablesWidths: _convertDynamicMapToTablesWidths(tablesWidths)));
    }
  }

  TableWidth? widthForModel(String modelId) {
    return state.tablesWidths[modelId];
  }
}

TablesWidths _convertDynamicMapToTablesWidths(DJson json) {
  final TablesWidths tablesWidths = {};
  final Iterable<MapEntry<dynamic, dynamic>> entries = json.entries;
  for (final MapEntry<dynamic, dynamic> entry in entries) {
    final TableWidth tableWidth = {};
    if (entry.key is! String || entry.value is! DJson) {
      continue;
    }
    final Iterable<MapEntry<dynamic, dynamic>> innerEntries = (entry.value as DJson).entries;
    for (final MapEntry<dynamic, dynamic> innerEntry in innerEntries) {
      if (innerEntry.key is! int || innerEntry.value is! double) {
        continue;
      }
      tableWidth[innerEntry.key] = innerEntry.value;
    }
    tablesWidths[entry.key] = tableWidth;
  }
  return tablesWidths;
}
