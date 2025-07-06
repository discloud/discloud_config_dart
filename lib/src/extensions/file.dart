// ignore_for_file: public_member_api_docs

import 'dart:io';
import 'dart:isolate';

extension FileExtension on File {
  Future<FileSystemEntity> isolateDelete() => Isolate.run(() => delete());
}
