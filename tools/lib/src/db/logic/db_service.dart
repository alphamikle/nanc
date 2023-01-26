import 'dart:async';

import 'package:config/config.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tools/src/db/logic/db_adapter.dart';
import 'package:tools/src/tools/logg.dart';
import 'package:tools/tools.dart';

const String _kDynamicBoxId = 'DYNAMIC_BOX';

typedef ObjectFactory<T, V> = T Function(V rawValue);

enum _DbServiceInitializationState {
  initialized,
  initialization,
  notInitialized,
}

class DbService {
  factory DbService() {
    return _instance ??= DbService._();
  }

  DbService._();

  static DbService? _instance;

  _DbServiceInitializationState _initializationState = _DbServiceInitializationState.notInitialized;

  Future<void> _init() async {
    if (_initializationState == _DbServiceInitializationState.initialized) {
      return;
    }

    if (_initializationState == _DbServiceInitializationState.notInitialized) {
      _initializationState = _DbServiceInitializationState.initialization;
      await Hive.initFlutter();
      if (Env.clearDb) {
        logg('Clearing DB');
        await Hive.deleteFromDisk();
      }
      _initializationState = _DbServiceInitializationState.initialized;
    } else if (_initializationState == _DbServiceInitializationState.initialization) {
      while (_initializationState == _DbServiceInitializationState.initialization) {
        await wait(duration: const Duration(milliseconds: 20));
      }
    }
  }

  void registerAdapter<T>(DbAdapter<T> adapter) {
    if (!Hive.isAdapterRegistered(adapter.adapter.typeId)) {
      Hive.registerAdapter(
        adapter.adapter,
        internal: adapter.internal,
        override: adapter.override,
      );
    }
  }

  Future<void> wipe() async {
    await _init();
    await Hive.deleteFromDisk();
    await Hive.close();
    _instance = null;
  }

  Future<T?> get<T extends Object, V extends Object>(String key, {ObjectFactory<T, V>? factory}) async {
    await _init();
    final Box<dynamic> dynamicBox = await _getBox<dynamic>(_kDynamicBoxId);
    final Object? value = dynamicBox.get(key);
    if (factory != null && value != null) {
      return factory(value as V);
    }
    return value as T?;
  }

  Future<bool> has(String key) async {
    await _init();
    final Box<dynamic> dynamicBox = await _getBox<dynamic>(_kDynamicBoxId);
    return dynamicBox.containsKey(key);
  }

  Future<void> save<T>({required String key, required T value}) async {
    await _init();
    final Box<dynamic> dynamicBox = await _getBox<dynamic>(_kDynamicBoxId);
    await dynamicBox.put(key, value);
  }

  Future<void> delete(String key) async {
    await _init();
    final Box<dynamic> dynamicBox = await _getBox<dynamic>(_kDynamicBoxId);
    await dynamicBox.delete(key);
  }

  Future<Box<T>> _getBox<T>([String? id]) async {
    final Box<T> typedBox = await Hive.openBox(id ?? '${T}Box');
    return typedBox;
  }
}

DbService createDbService() => DbService();
