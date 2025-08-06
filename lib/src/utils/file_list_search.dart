import 'dart:io';

void _noop(Object _, StackTrace __) {}

/// Recursively lists files in a directory and its subdirectories,
/// filtering them based on a test function.
///
/// The [where] function is called for each file found, and only files for
/// which the function returns `true` are included in the output stream.
///
/// The [onError] function is called when an error occurs while listing the
/// files. If it is not provided, errors are ignored.
Stream<File> fileListSearch(
  Directory directory,
  bool Function(File file) where, [
  Function? onError,
]) async* {
  onError ??= _noop;

  await for (final e in directory.list(recursive: true).handleError(onError)) {
    if (e is File && where(e)) yield e;
  }
}
