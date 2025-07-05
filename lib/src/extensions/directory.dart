// ignore_for_file: public_member_api_docs

import 'dart:io';
import 'dart:isolate';

extension DirectoryExtension on Directory {
  Future<FileSystemEntity> isolateDelete({bool recursive = false}) =>
      Isolate.run(() => delete(recursive: recursive));
}
