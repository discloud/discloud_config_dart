import 'dart:io';

import 'package:path/path.dart' as p;

/// An extension on the [FileSystemEntity] class that provides additional
/// path-related properties and methods.
///
/// This extension simplifies path manipulation by providing convenient access
/// to common path operations.
extension FileSystemEntityExtension on FileSystemEntity {
  /// The base name of the file or directory.
  ///
  /// For example, for the path `/path/to/file.txt`, the basename is `file.txt`.
  String get basename => p.basename(path);

  /// The base name of the file or directory without its extension.
  ///
  /// For example, for the path `/path/to/file.txt`, the basename without
  /// extension is `file`.
  String get basenameWithoutExtension => p.basenameWithoutExtension(path);

  /// The directory name of the path.
  ///
  /// For example, for the path `/path/to/file.txt`, the dirname is `/path/to`.
  String get dirname => p.dirname(path);

  /// The extension of the file.
  ///
  /// For example, for the path `/path/to/file.txt`, the extension is `.txt`.
  String get extension => p.extension(path);

  /// The path without its extension.
  ///
  /// For example, for the path `/path/to/file.txt`, the path without extension
  /// is `/path/to/file`.
  String get withoutExtension => p.withoutExtension(path);

  /// The extension of the file, allowing for multiple levels.
  ///
  /// For example, for the path `/path/to/file.tar.gz`, `getExtension(1)`
  /// returns `.gz`, and `getExtension(2)` returns `.tar.gz`.
  String getExtension([int level = 1]) => p.extension(path, level);

  /// Joins the given path parts into a single path using the current platform's
  /// [separator].
  ///
  /// This is a convenient way to build paths without having to worry about
  /// the correct separator.
  String joinAll(Iterable<String> parts) => p.joinAll([path, ...parts]);

  /// Returns the relative path from this entity to the given [path].
  String relative(String path) => p.relative(path, from: this.path);
}
