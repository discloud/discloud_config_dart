import "dart:convert";
import "dart:io";
import "dart:isolate";

/// An extension on the [File] class.
extension FileExtension on File {
  /// Deletes the file in a separate isolate to avoid blocking the main thread.
  Future<FileSystemEntity> isolateDelete() => Isolate.run(delete);

  Future<File> writeAsBytesAtomically(List<int> bytes) async {
    final temp = File("${path}_${DateTime.now().millisecondsSinceEpoch}");
    try {
      await temp.writeAsBytes(bytes, flush: true);
      await temp.rename(path);
    } on FileSystemException {
      try {
        await temp.delete();
      } on FileSystemException {
        // ignored
      }
      rethrow;
    }
    return this;
  }

  Future<File> writeAsStringAtomically(
    String contents, {
    Encoding encoding = utf8,
  }) async {
    final temp = File("${path}_${DateTime.now().millisecondsSinceEpoch}");
    try {
      await temp.writeAsString(contents, encoding: encoding, flush: true);
      await temp.rename(path);
    } catch (_) {
      try {
        await temp.delete();
      } catch (_) {}
      rethrow;
    }
    return this;
  }
}
