import 'dart:io';

extension FileSystemEventExtension on FileSystemEvent {
  bool get isCreate => type == FileSystemEvent.create;
  bool get isDelete => type == FileSystemEvent.delete;
  bool get isModify => type == FileSystemEvent.modify;
  bool get isMove => type == FileSystemEvent.move;
}
