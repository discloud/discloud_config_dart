import 'dart:async';
import 'dart:io';

import 'package:discloud_config/comments/comments.dart';
import 'package:discloud_config/data.dart';
import 'package:discloud_config/enum.dart';
import 'package:discloud_config/extensions/file_system_entity.dart';
import 'package:discloud_config/parser.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;

class DiscloudConfig with ChangeNotifier {
  static const filename = "discloud.config";

  static Future<DiscloudConfig> fromFileSystemEntity(
    FileSystemEntity entity,
  ) async {
    if (entity is File) {
      if (entity.basename != filename) entity = entity.parent;
    }

    if (entity is! File) {
      final filePath = p.join(entity.path, filename);
      entity = File(filePath);
    }

    if (!await entity.exists()) return DiscloudConfig(entity);

    List<String> lines = await entity.readAsLines();

    return DiscloudConfig(entity, lines);
  }

  static Future<DiscloudConfig> fromPath(String path) async {
    final entityType = await FileSystemEntity.type(path);
    return await switch (entityType) {
      FileSystemEntityType.directory => fromFileSystemEntity(Directory(path)),
      FileSystemEntityType.file => fromFileSystemEntity(File(path)),
      FileSystemEntityType.notFound => fromFileSystemEntity(File(path).parent),
      _ => throw Exception("Invalid path"),
    };
  }

  static Future<DiscloudConfig> fromUri(Uri uri) {
    return fromPath(uri.toFilePath());
  }

  DiscloudConfig(File file, [List<String>? lines]) {
    if (lines == null) {
      if (file.basename != filename) {
        final filePath = p.join(file.parent.path, filename);
        file = File(filePath);
      }

      if (file.existsSync()) lines = file.readAsLinesSync();
    }

    final rawData = _parser.parseLines(lines ?? []);
    _rawData.addAll(rawData);

    // ignore: prefer_initializing_formals
    this.file = file;
  }

  late final File file;
  late Stream<FileSystemEvent>? _fileWatch;
  late StreamSubscription<FileSystemEvent>? _watchSubscription;

  late final _inlineCommentRepository = InlineCommentRepository();
  late final _parser = Parser(
    inlineCommentRepository: _inlineCommentRepository,
  );

  final Map<String, dynamic> _rawData = {};
  DiscloudConfigData get data => DiscloudConfigData.fromJson(_rawData);

  File? get mainFile {
    if (!_rawData.containsKey(DiscloudScope.MAIN.name)) return null;
    final String mainPath = _rawData[DiscloudScope.MAIN.name];
    if (mainPath.isEmpty) return null;
    return File(p.join(file.parent.path, mainPath));
  }

  Future<void> cancelWatch() async {
    final streamSubscription = _watchSubscription;
    if (streamSubscription != null) {
      _watchSubscription = null;
      await streamSubscription.cancel();
    }
  }

  @override
  Future<void> dispose() async {
    await cancelWatch();

    super.dispose();
  }

  Future<void> set(DiscloudScope key, dynamic value) {
    _rawData[key.name] = value;
    return _write();
  }

  Stream<FileSystemEvent> _watch() {
    return _fileWatch ??= file.watch();
  }

  StreamSubscription<FileSystemEvent> watch({
    void Function(FileSystemEvent)? onData,
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) {
    if (_watchSubscription == null) {
      return _watchSubscription = _watch().listen(
        (event) async {
          switch (event.type) {
            case FileSystemEvent.create:
            case FileSystemEvent.modify:
              if (!await file.exists()) break;

              final lines = await file.readAsLines();
              final rawData = _parser.parseLines(lines);

              _rawData
                ..clear()
                ..addAll(rawData);

              break;
          }

          notifyListeners();

          if (onData != null) onData(event);
        },
        cancelOnError: cancelOnError,
        onDone: onDone,
        onError: onError ?? () => null,
      );
    }

    return (_watchSubscription ??= watch(
        cancelOnError: cancelOnError,
        onData: onData,
      ))
      ..onDone(onDone)
      ..onError(onError);
  }

  Future<void> _write() async {
    final content = _parser.stringify(data.toJson());

    await file.writeAsString(content);
  }
}
