import "dart:async";
import "dart:io";

import "package:discloud_config/src/comments/comments.dart";
import "package:discloud_config/src/data.dart";
import "package:discloud_config/src/extensions/file_system_entity.dart";
import "package:discloud_config/src/extensions/file_system_event.dart";
import "package:discloud_config/src/parser.dart";
import "package:discloud_config/src/scopes.dart";
import "package:discloud_config/src/validator/validator.dart";
import "package:path/path.dart" as p;

/// Manages the `discloud.config` file, providing methods for reading, writing,
/// and validating your Discloud configurations.
///
/// This class allows you to interact with the configuration file in a simple
/// and programmatic way, abstracting the file parsing and manipulation.
///
/// ### Example
/// ```dart
/// import 'dart:io';
/// import 'package:discloud_config/discloud_config.dart';
///
/// void main() async {
///   // Create a DiscloudConfig instance from a directory path.
///   final config = await DiscloudConfig.fromPath('path/to/your/project');
///
///   // Create the file if it doesn't exist.
///   await config.create();
///
///   // Set some configuration values.
///   await config.set(DiscloudScope.RAM, 1024);
///   await config.set(DiscloudScope.AUTORESTART, true);
///
///   // Access the configuration data.
///   print('RAM: ${config.data.RAM}'); // Output: RAM: 1024
///
///   // Watch for file changes.
///   config.watch().listen((data) {
///     print('Config file changed!');
///   });
/// }
/// ```
class DiscloudConfig {
  /// The name of the configuration file: `discloud.config`.
  static const filename = "discloud.config";

  /// Creates a [DiscloudConfig] instance asynchronously from a [FileSystemEntity].
  ///
  /// If the provided [entity] is a file, it will be used directly. If it is a
  /// directory, this method will look for a `discloud.config` file within it.
  ///
  /// **Note:** This method does not create the file upon instantiation.
  /// However, the file will be created automatically if you set a property
  /// using [set] or [setData]. Alternatively, you can call [create] to create
  /// it manually.
  static Future<DiscloudConfig> fromFileSystemEntity(
    FileSystemEntity entity,
  ) async {
    if (entity is File && entity.basename != filename) entity = entity.parent;

    if (entity is! File) {
      final parts = [entity.path, filename];
      final path = p.joinAll(parts);
      entity = File(path);
    }

    final config = DiscloudConfig._withLines(entity, []);

    await config.refresh();

    return config;
  }

  /// Creates a [DiscloudConfig] instance asynchronously from a file path string.
  ///
  /// This is a convenience method that determines the type of the file system
  /// entity at the given [path] and calls [fromFileSystemEntity].
  ///
  /// **Note:** This method does not create the file upon instantiation.
  /// However, the file will be created automatically if you set a property
  /// using [set] or [setData]. Alternatively, you can call [create] to create
  /// it manually.
  static Future<DiscloudConfig> fromPath(String path) async {
    final entityType = await FileSystemEntity.type(path);
    return switch (entityType) {
      FileSystemEntityType.directory => fromFileSystemEntity(Directory(path)),
      FileSystemEntityType.file => fromFileSystemEntity(File(path)),
      FileSystemEntityType.notFound => fromFileSystemEntity(File(path).parent),
      _ => throw ArgumentError.value(path, "path"),
    };
  }

  /// Creates a [DiscloudConfig] instance asynchronously from a [Uri].
  ///
  /// This is a convenience method that converts [Uri] to [path]
  /// and calls [fromPath].
  ///
  /// **Note:** This method does not create the file upon instantiation.
  /// However, the file will be created automatically if you set a property
  /// using [set] or [setData]. Alternatively, you can call [create] to create
  /// it manually.
  static Future<DiscloudConfig> fromUri(Uri uri) {
    return fromPath(uri.toFilePath());
  }

  DiscloudConfig._withLines(File file, Iterable<String> lines) {
    if (file.basename != filename) {
      final filePath = p.joinAll([file.parent.path, filename]);
      file = File(filePath);
    }

    // ignore: prefer_initializing_formals
    this.file = file;

    if (lines.isEmpty) return;

    final rawData = _configParser.parseLines(lines);
    _rawData.addAll(rawData);
  }

  /// Creates a new [DiscloudConfig] instance from a [File] object.
  ///
  /// **Note:** This factory only creates the instance and does not read the
  /// file from the disk. You must call [refresh] after instantiation to load the
  /// configuration data. For a more convenient approach, use the static
  /// `fromPath` or `fromFileSystemEntity` methods.
  factory DiscloudConfig(File file) =>
      DiscloudConfig._withLines(file, const []);

  /// The configuration file.
  late final File file;

  final _inlineCommentRepository = InlineCommentRepository();
  late final _configParser = DiscloudConfigParser(
    inlineCommentRepository: _inlineCommentRepository,
  );

  final Map<String, dynamic> _rawData = {};
  DiscloudConfigData? _data;

  /// The parsed configuration data as a [DiscloudConfigData] object.
  ///
  /// The data is cached for performance. It is only re-parsed when the
  /// configuration is modified programmatically or when [refresh] is called.
  DiscloudConfigData get data =>
      _data ??= DiscloudConfigData.fromJson(_rawData);

  /// The `ID` property from the configuration file.
  String? get appId => _rawData[DiscloudScope.ID.name];

  /// The `MAIN` property from the configuration file, returned as a [File] object.
  File? get main {
    if (_rawData[DiscloudScope.MAIN.name] case final String path) {
      if (path.isEmpty) return null;
      return File(p.joinAll([file.parent.path, path]));
    }
    return null;
  }

  /// Creates the configuration file if it does not exist.
  Future<void> create() async {
    if (await file.exists()) return;
    _data = null;
    await file.create();
  }

  /// Deletes the configuration file if it exists.
  Future<void> delete() async {
    if (!await file.exists()) return;
    await file.delete();
  }

  /// Reloads the configuration from the file.
  ///
  /// This method is useful when the file has been modified by an external
  /// process and you want to update the configuration in your application.
  ///
  /// Returns `true` if the file was successfully reloaded, or `false` if the
  /// file does not exist.
  Future<bool> refresh() async {
    if (!await file.exists()) return false;

    final lines = await file.readAsLines();

    final rawData = _configParser.parseLines(lines);

    _rawData
      ..clear()
      ..addAll(rawData);

    _data = null;

    return true;
  }

  /// Sets a dynamic value for a given [DiscloudScope] and writes it to the file.
  ///
  /// ### Example
  /// ```dart
  /// await config.set(DiscloudScope.RAM, 512);
  /// ```
  ///
  /// See the [configuration docs](https://docs.discloud.com/en/configurations/discloud.config)
  /// for more details on the available scopes and values.
  Future<void> set(DiscloudScope key, dynamic value) {
    _rawData[key.name] = value;
    _data = null;
    return _write();
  }

  /// Sets the entire configuration data and writes it to the file.
  ///
  /// See the [configuration docs](https://docs.discloud.com/en/configurations/discloud.config)
  /// for more details on the available scopes and values.
  Future<void> setData(DiscloudConfigData data) {
    _rawData.addAll(data.toJson());
    _data = null;
    return _write();
  }

  /// Validates the configuration against the defined schema.
  ///
  /// This method checks if the required properties are present and if their
  /// values are valid according to the Discloud documentation.
  Future<void> validate() async {
    await DiscloudValidator.validateAll(this);
  }

  /// Watches the configuration file for changes.
  ///
  /// This stream emits a new [DiscloudConfigData] object whenever the file is
  /// modified. The stream will close if the file is deleted or moved.
  Stream<DiscloudConfigData?> watch() async* {
    await for (final event in file.watch()) {
      if (event.isDelete || !await refresh()) {
        yield null;
        continue;
      }

      yield data;
    }
  }

  /// Writes the current configuration to the file.
  Future<void> _write() async {
    final content = _configParser.stringify(data.toJson());

    await file.writeAsString(content, flush: true);
  }
}
