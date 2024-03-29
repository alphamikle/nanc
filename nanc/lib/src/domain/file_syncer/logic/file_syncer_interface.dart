import 'file_syncer_native.dart' if (dart.library.html) 'file_syncer_web.dart' as impl;

abstract class FileSyncer {
  factory FileSyncer() => impl.fileSyncerFactory();

  Stream<String?> get fileContent;
  Stream<bool> get syncerActiveStatus;

  Future<bool> syncWithFile();
  Future<void> dispose();
}
