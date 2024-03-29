import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'file_syncer_interface.dart';

class FileSyncerNative implements FileSyncer {
  final StreamController<String?> _contentStreamController = StreamController.broadcast();
  final StreamController<bool> _syncerActiveStatusStreamController = StreamController.broadcast();
  StreamSubscription<FileSystemEvent>? _fileEventsSubscription;
  String? _syncedFilePath;
  bool _isDisposed = false;

  @override
  Stream<String?> get fileContent => _contentStreamController.stream;

  @override
  Stream<bool> get syncerActiveStatus => _syncerActiveStatusStreamController.stream;

  @override
  Future<bool> syncWithFile() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
      dialogTitle: 'Please, select a file for content synchronization',
    );
    if (result != null && result.files.isNotEmpty) {
      final PlatformFile platformFile = result.files.first;
      final String filePath = platformFile.path ?? '';
      if (filePath.isNotEmpty) {
        await _syncWithFile(File(filePath));
        return true;
      }
    }
    return false;
  }

  Future<void> _syncWithFile(File file) async {
    _syncedFilePath = file.path;
    final String fileContent = await file.readAsString();
    _contentStreamController.add(fileContent);
    final Stream<FileSystemEvent> eventStream = file.watch();
    _fileEventsSubscription = eventStream.listen(_fileEventsHandler);
  }

  Future<void> _fileEventsHandler(FileSystemEvent event) async {
    if (_syncedFilePath != null && event.type == FileSystemEvent.modify) {
      final String fileContent = await File(_syncedFilePath!).readAsString();
      _contentStreamController.add(fileContent);
    } else {
      await dispose();
    }
  }

  @override
  Future<void> dispose() async {
    if (_isDisposed) {
      return;
    }
    _isDisposed = true;
    _syncerActiveStatusStreamController.add(false);
    await _fileEventsSubscription?.cancel();
    _fileEventsSubscription = null;
    _syncedFilePath = null;
    await _syncerActiveStatusStreamController.close();
    await _contentStreamController.close();
  }
}

FileSyncer fileSyncerFactory() => FileSyncerNative();
