// ignore_for_file: parameter_assignments

import 'dart:async';
import 'dart:io';

import 'package:discloud_config/src/comments/comments.dart';
import 'package:discloud_config/src/data.dart';
import 'package:discloud_config/src/extensions/file_system_entity.dart';
import 'package:discloud_config/src/extensions/file_system_event.dart';
import 'package:discloud_config/src/parser.dart';
import 'package:discloud_config/src/scopes.dart';
import 'package:discloud_config/src/validator/validator.dart';
import 'package:path/path.dart' as p;

/// the [lines] argument receives a list of lines from the configuration file contents
class DiscloudConfig {
  /// `discloud.config`
  static const filename = "discloud.config";

  /// Asynchronous instance from [FileSystemEntity]
  static Future<DiscloudConfig> fromFileSystemEntity(
    FileSystemEntity entity,
  ) async {
    if (entity is File && entity.basename != filename) entity = entity.parent;

    if (entity is! File) entity = File(p.join(entity.path, filename));

    if (!await entity.exists()) return DiscloudConfig(entity);

    final List<String> lines = await entity.readAsLines();

    return DiscloudConfig(entity, lines);
  }

  /// Asynchronous instance from [String] path
  static Future<DiscloudConfig> fromPath(String path) async {
    final entityType = await FileSystemEntity.type(path);
    return await switch (entityType) {
      FileSystemEntityType.directory => fromFileSystemEntity(Directory(path)),
      FileSystemEntityType.file => fromFileSystemEntity(File(path)),
      FileSystemEntityType.notFound => fromFileSystemEntity(File(path).parent),
      _ => throw Exception("Invalid path"),
    };
  }

  /// Asynchronous instance from [Uri] path
  static Future<DiscloudConfig> fromUri(Uri uri) {
    return fromPath(uri.toFilePath());
  }

  /// the [lines] argument receives a list of lines from the configuration file contents
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

    final rawData = _configParser.parseLines(lines ?? []);
    _rawData.addAll(rawData);
  }

  /// The configuration [File] - maybe
  late final File file;

  late final _inlineCommentRepository = InlineCommentRepository();
  late final _configParser = DiscloudConfigParser(
    inlineCommentRepository: _inlineCommentRepository,
  );

  final Map<String, dynamic> _rawData = {};
  DiscloudConfigData? _data;

  /// readonly
  DiscloudConfigData get data =>
      _data ??= DiscloudConfigData.fromJson(_rawData);

  /// The `ID` property from configuration [File]
  String? get appId => _rawData[DiscloudScope.ID.name];

  /// The `MAIN` property from configuration [File]
  File? get main {
    if (_rawData[DiscloudScope.MAIN.name] case final String path) {
      if (path.isEmpty) return null;
      return File(p.join(file.parent.path, path));
    }
    return null;
  }

  /// Create a configuration [File] - if not exists
  Future<void> create() async {
    if (await file.exists()) return;
    _data = null;
    await file.create();
  }

  /// Delete a configuration [File] - if exists
  Future<void> delete() async {
    if (!await file.exists()) return;
    await file.delete();
  }

  /// Set a [dynamic] value for a [DiscloudScope]
  ///
  /// See [configuration docs](https://docs.discloudbot.com/discloud.config)
  Future<void> set(DiscloudScope key, dynamic value) {
    _rawData[key.name] = value;
    _data = null;
    return _write();
  }

  /// Set [DiscloudConfigData]
  ///
  /// See [configuration docs](https://docs.discloudbot.com/discloud.config)
  Future<void> setData(DiscloudConfigData data) {
    _rawData.addAll(data.toJson());
    _data = null;
    return _write();
  }

  /// Validate configuration schema
  Future<void> validate() async {
    await DiscloudValidator.validateAll(this);
  }

  /// Watch the configuration [File] for changes
  ///
  /// Works until `delete` or `move` [File]
  ///
  /// Emits [DiscloudConfigData] on all changes
  ///
  /// No emit on `delete` or `move`
  Stream<DiscloudConfigData> watch() async* {
    await for (final event in file.watch()) {
      if (event.isDelete || !await file.exists()) break;

      final lines = await file.readAsLines();

      final rawData = _configParser.parseLines(lines);

      _rawData
        ..clear()
        ..addAll(rawData);

      _data = null;

      yield data;
    }
  }

  Future<void> _write() async {
    final content = _configParser.stringify(data.toJson());

    await file.writeAsString(content, flush: true);
  }
}
