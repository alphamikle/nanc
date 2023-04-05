import 'dart:async';
import 'dart:js_util';

import 'package:js/js.dart';

import 'file_syncer_interface.dart';

class FileSyncerWeb implements FileSyncer {
  final StreamController<String?> _contentStreamController = StreamController.broadcast();
  final StreamController<bool> _syncerActiveStatusStreamController = StreamController.broadcast();
  bool _isDisposed = false;
  String? _content;
  Timer? _refreshTimer;

  @override
  Stream<String?> get fileContent => _contentStreamController.stream;

  @override
  Stream<bool> get syncerActiveStatus => _syncerActiveStatusStreamController.stream;

  @override
  Future<bool> syncWithFile() async {
    final String? fileContent = await loadFileContent();
    if (fileContent != null) {
      _contentStreamController.add(fileContent);
      _content = fileContent;
      await Future<void>.delayed(const Duration(seconds: 3));
      _initRefreshTimer();
      return true;
    }
    return false;
  }

  void _initRefreshTimer() {
    _refreshTimer = Timer.periodic(const Duration(seconds: 1), (_) async {
      final String? fileContent = await loadFileContent();
      if (fileContent != null && fileContent != _content) {
        _contentStreamController.add(fileContent);
        _content = fileContent;
      }
    });
  }

  @override
  Future<void> dispose() async {
    if (_isDisposed) {
      return;
    }
    _isDisposed = true;
    _syncerActiveStatusStreamController.add(false);
    _content = null;
    _refreshTimer?.cancel();
    _refreshTimer = null;
    await closeFileSystemHandleJS();
    await _syncerActiveStatusStreamController.close();
    await _contentStreamController.close();
  }
}

Future<String?> loadFileContent() async {
  final Object? fileContentRaw = await promiseToFuture(syncWithFileJS());
  String? fileContent;
  if (fileContentRaw != null) {
    fileContent = fileContentRaw.toString();
  }
  return fileContent;
}

@JS('syncWithFileJS')
external Object syncWithFileJS();

@JS('closeFileSystemHandleJS')
external Future<void> closeFileSystemHandleJS();

FileSyncer fileSyncerFactory() => FileSyncerWeb();
