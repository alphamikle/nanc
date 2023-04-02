import 'package:flutter/material.dart';

class DataContext extends InheritedWidget {
  const DataContext({
    required this.storage,
    required super.child,
    super.key,
  });

  final ValueNotifier<Map<String, dynamic>> storage;

  static DataContext of(BuildContext context) {
    final DataContext? dataContext = context.dependOnInheritedWidgetOfExactType<DataContext>();
    if (dataContext == null) {
      throw Exception('Not found DataContext at the widget tree');
    }
    return dataContext;
  }

  void set<T>(String key, T value) {
    final Map<String, dynamic> oldValue = storage.value;
    storage.value = {
      ...oldValue,
      key: value,
    };
  }

  T? get<T>(String key) {
    return storage.value[key];
  }

  void remove(String key) {
    final Map<String, dynamic> oldValue = storage.value;
    final Map<String, dynamic> newValue = {...oldValue};
    newValue.remove(key);
    storage.value = {...newValue};
  }

  void clear() {
    final Map<String, dynamic> oldValue = storage.value;
    storage.value = {};
    oldValue.clear();
  }

  @override
  bool updateShouldNotify(DataContext oldWidget) => oldWidget.storage.value != storage.value;
}
