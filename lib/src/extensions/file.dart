import "dart:convert";
import "dart:io";
import "dart:isolate";

/// An extension on the [File] class.
extension FileExtension on File {
  /// Deletes the file in a separate isolate to avoid blocking the main thread.
  Future<FileSystemEntity> isolateDelete() => Isolate.run(delete);

  /// Atomically writes the given [bytes] to the file.
  ///
  /// This is done by first writing to a temporary file and then renaming it to
  /// the original path. This ensures that the file is never left in a partially
  /// written state.
  Future<File> writeAsBytesAtomically(List<int> bytes) async {
    final temp = File("${path}_${DateTime.now().microsecondsSinceEpoch}");
    await temp.writeAsBytes(bytes, flush: true);
    try {
      await temp.rename(path);
    } catch (e) {
      try {
        await temp.delete();
      } catch (_) {}
      rethrow;
    }
    return this;
  }

  /// Atomically writes the given [contents] to the file.
  ///
  /// This is done by first writing to a temporary file and then renaming it to
  /// the original path. This ensures that the file is never left in a partially
  /// written state.
  Future<File> writeAsStringAtomically(
    String contents, {
    Encoding encoding = utf8,
  }) async {
    final temp = File("${path}_${DateTime.now().microsecondsSinceEpoch}");
    await temp.writeAsString(contents, encoding: encoding, flush: true);
    try {
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
