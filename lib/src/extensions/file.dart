import "dart:convert";
import "dart:io";
import "dart:isolate";
import "dart:math";
import "dart:typed_data";

import "package:path/path.dart";

/// An extension on the [File] class.
///
/// This extension provides additional utility methods for file operations,
/// including atomic writes and limited-length reads. These methods enhance
/// the standard [File] API with functionality for safe concurrent access
/// and efficient handling of large files.
extension FileExtension on File {
  static final _random = Random();

  /// Deletes the file in a separate isolate to avoid blocking the main thread.
  ///
  /// This method runs the file deletion operation in a separate isolate
  /// to prevent blocking the main thread during I/O operations.
  ///
  /// Returns a [Future] that completes with the [FileSystemEntity] after deletion.
  Future<FileSystemEntity> isolateDelete() => Isolate.run(delete);

  /// Reads the first chunk of data from the file.
  ///
  /// This method streams the file content and returns only the first chunk
  /// without reading the entire file into memory. This is useful for files
  /// that are too large to read all at once.
  ///
  /// Parameters:
  ///   - [limit]: Optional maximum number of bytes to read. If `null`, reads
  ///     the entire first chunk as provided by the stream.
  ///
  /// Returns a [Future] that completes with a [Uint8List] containing the
  /// first chunk of bytes from the file.
  Future<Uint8List> getFirstChunk([int? limit]) async {
    late final Uint8List first;
    await for (final chunk in openRead(null, limit)) {
      first = Uint8List.fromList(chunk);
      break;
    }
    return first;
  }

  /// Reads a limited number of bytes from the file.
  ///
  /// This method reads the file content with an optional byte limit.
  /// If the [limit] exceeds the file length, only the available bytes are read.
  ///
  /// Parameters:
  ///   - [limit]: Optional maximum number of bytes to read. If `null` or
  ///     greater than the file length, all available bytes are read.
  ///
  /// Returns a [Future] that completes with a [Uint8List] containing the
  /// read bytes, up to the specified [limit] or file length.
  Future<Uint8List> readAsBytesLimited([int? limit]) async {
    final fileLength = await length();

    if (limit != null && limit > fileLength) limit = fileLength;

    final list = Uint8List(limit ?? fileLength);

    int index = 0;
    await for (final chunk in openRead(null, limit)) {
      list.setRange(index, index += chunk.length, chunk);
    }

    return list;
  }

  /// Reads a limited number of bytes from the file and decodes them as a string.
  ///
  /// This method reads the file content with an optional byte limit and then
  /// decodes the bytes using the specified [encoding]. If no encoding is provided,
  /// UTF-8 is used by default.
  ///
  /// Parameters:
  ///   - [limit]: Optional maximum number of bytes to read. If `null` or
  ///     greater than the file length, all available bytes are read.
  ///   - [encoding]: The character encoding to use for decoding. Defaults to UTF-8.
  ///
  /// Returns a [Future] that completes with a [String] containing the decoded
  /// file content, up to the specified [limit] or file length.
  Future<String> readAsStringLimited([
    int? limit,
    Encoding encoding = utf8,
  ]) async => encoding.decode(await readAsBytesLimited(limit));

  /// Atomically writes the given [bytes] to the file.
  ///
  /// This method ensures atomic file writing by first writing to a temporary file
  /// and then renaming it to the original path. This guarantees that the file is
  /// never left in a partially written state, even if the operation is interrupted.
  ///
  /// The method follows these steps:
  /// 1. Creates a temporary file with a random suffix
  /// 2. Writes the bytes to the temporary file with flush enabled
  /// 3. Atomically renames the temporary file to the target path
  /// 4. Cleans up the temporary file if renaming fails
  ///
  /// Parameters:
  ///   - [bytes]: The byte data to write to the file.
  ///
  /// Returns a [Future] that completes with this [File] instance after
  /// the bytes have been successfully written.
  ///
  /// Throws:
  ///   - [FileSystemException]: If the write or rename operation fails.
  Future<File> writeAsBytesAtomically(List<int> bytes) async {
    final tempPath = joinAll([
      dirname(path),
      ".${basename(path)}-${_random.nextDouble()}",
    ]);
    final temp = File(tempPath);
    await temp.writeAsBytes(bytes, flush: true);
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

  /// Atomically writes the given [contents] to the file.
  ///
  /// This method ensures atomic file writing by first writing to a temporary file
  /// and then renaming it to the original path. This guarantees that the file is
  /// never left in a partially written state, even if the operation is interrupted.
  ///
  /// The method follows these steps:
  /// 1. Creates a temporary file with a random suffix
  /// 2. Encodes the string contents using the specified encoding
  /// 3. Writes the encoded bytes to the temporary file with flush enabled
  /// 4. Atomically renames the temporary file to the target path
  /// 5. Cleans up the temporary file if renaming fails
  ///
  /// Parameters:
  ///   - [contents]: The string content to write to the file.
  ///   - [encoding]: The character encoding to use. Defaults to UTF-8.
  ///
  /// Returns a [Future] that completes with this [File] instance after
  /// the contents have been successfully written.
  ///
  /// Throws:
  ///   - [FileSystemException]: If the write or rename operation fails.
  Future<File> writeAsStringAtomically(
    String contents, {
    Encoding encoding = utf8,
  }) async {
    final tempPath = joinAll([
      dirname(path),
      ".${basename(path)}-${_random.nextDouble()}",
    ]);
    final temp = File(tempPath);
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
