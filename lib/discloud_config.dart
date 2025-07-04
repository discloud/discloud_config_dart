import 'dart:async';
import 'dart:io';

import 'package:discloud_config/comments/comments.dart';
import 'package:discloud_config/data.dart';
import 'package:discloud_config/extensions/file_system_entity.dart';
import 'package:discloud_config/parser.dart';
import 'package:discloud_config/scopes.dart';
import 'package:discloud_config/validator/validator.dart';
import 'package:path/path.dart' as p;

class DiscloudConfig {
  static const filename = "discloud.config";

  static Future<DiscloudConfig> fromFileSystemEntity(
    FileSystemEntity entity,
  ) async {
    if (entity is File && entity.basename != filename) entity = entity.parent;

    if (entity is! File) entity = File(p.join(entity.path, filename));

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

    // ignore: prefer_initializing_formals
    this.file = file;

    final rawData = _parser.parseLines(lines ?? []);
    _rawData.addAll(rawData);
  }

  late final File file;
  Stream<FileSystemEvent>? _fileWatch;
  StreamSubscription<FileSystemEvent>? _watchSubscription;

  late final _inlineCommentRepository = InlineCommentRepository();
  late final _parser = Parser(
    inlineCommentRepository: _inlineCommentRepository,
  );

  final Map<String, dynamic> _rawData = {};
  DiscloudConfigData? _data;
  DiscloudConfigData get data =>
      _data ??= DiscloudConfigData.fromJson(_rawData);

  String? get appId => _rawData[DiscloudScope.ID.name];

  File? get main {
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

  Future<void> create() async {
    if (await file.exists()) return;
    _data = null;
    await file.create();
  }

  Future<void> delete() async {
    if (!await file.exists()) return;
    await file.delete();
  }

  Future<void> dispose() async {
    await cancelWatch();
  }

  Future<void> set(DiscloudScope key, dynamic value) {
    _rawData[key.name] = value;
    _data = null;
    return _write();
  }

  Future<void> setData(DiscloudConfigData data) {
    _rawData.addAll(data.toJson());
    _data = null;
    return _write();
  }

  Future<void> validate() async {
    await DiscloudValidator.validateAll(this);
  }

  Stream<DiscloudConfigData> watch() async* {
    await for (final event in _watch()) {
      switch (event.type) {
        case FileSystemEvent.create:
        case FileSystemEvent.modify:
          if (!await file.exists()) break;

          final lines = await file.readAsLines();

          final rawData = _parser.parseLines(lines);

          _rawData
            ..clear()
            ..addAll(rawData);

          _data = null;

          break;
      }

      yield data;
    }
  }

  Stream<FileSystemEvent> _watch() {
    return _fileWatch ??= file.watch();
  }

  Future<void> _write() async {
    final content = _parser.stringify(data.toJson());

    _watchSubscription?.pause();

    await file.writeAsString(content, flush: true);

    _watchSubscription?.resume();
  }
}
