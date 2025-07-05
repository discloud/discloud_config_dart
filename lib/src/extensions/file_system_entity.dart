// ignore_for_file: public_member_api_docs

import 'dart:io';
import 'dart:isolate';

import 'package:path/path.dart' as p;

extension FileSystemEntityExtension on FileSystemEntity {
  String get basename => p.basename(path);
  String get basenameWithoutExtension => p.basenameWithoutExtension(path);
  String get dirname => p.dirname(path);
  String get extension => p.extension(path);
  String get withoutExtension => p.withoutExtension(path);

  Future<FileSystemEntity> isolateDelete() => Isolate.run(() => delete());
  String relative(String path) => p.relative(path, from: this.path);
}
