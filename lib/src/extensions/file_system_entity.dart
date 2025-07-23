import 'dart:io';

import 'package:path/path.dart' as p;

/// An extension on the [FileSystemEntity] class for path-related operations.
extension FileSystemEntityExtension on FileSystemEntity {
  /// The base name of the file or directory.
  String get basename => p.basename(path);

  /// The base name of the file or directory without its extension.
  String get basenameWithoutExtension => p.basenameWithoutExtension(path);

  /// The directory name of the path.
  String get dirname => p.dirname(path);

  /// The extension of the file.
  String get extension => p.extension(path);

  /// The path without its extension.
  String get withoutExtension => p.withoutExtension(path);

  /// Returns the relative path from this entity to the given [path].
  String relative(String path) => p.relative(path, from: this.path);
}
