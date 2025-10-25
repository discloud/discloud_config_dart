import "dart:io";

/// An extension on the [FileSystemEvent] class to simplify event type checking.
extension FileSystemEventExtension on FileSystemEvent {
  /// Returns `true` if the event is a create event.
  bool get isCreate => type == FileSystemEvent.create;

  /// Returns `true` if the event is a delete event.
  bool get isDelete => type == FileSystemEvent.delete;

  /// Returns `true` if the event is a modify event.
  bool get isModify => type == FileSystemEvent.modify;

  /// Returns `true` if the event is a move event.
  bool get isMove => type == FileSystemEvent.move;
}
