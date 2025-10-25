import "dart:io";
import "dart:isolate";

/// An extension on the [Directory] class.
extension DirectoryExtension on Directory {
  /// Deletes the directory in a separate isolate to avoid blocking the main thread.
  Future<FileSystemEntity> isolateDelete({bool recursive = false}) =>
      Isolate.run(() => delete(recursive: recursive));
}
