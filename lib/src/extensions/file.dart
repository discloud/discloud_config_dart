import 'dart:io';
import 'dart:isolate';

/// An extension on the [File] class.
extension FileExtension on File {
  /// Deletes the file in a separate isolate to avoid blocking the main thread.
  Future<FileSystemEntity> isolateDelete() => Isolate.run(() => delete());
}
