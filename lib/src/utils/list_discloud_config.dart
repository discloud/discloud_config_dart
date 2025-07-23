import 'dart:async';
import 'dart:io';

import 'package:discloud_config/src/discloud_config.dart';
import 'package:discloud_config/src/extensions/file_system_entity.dart';

/// Lists all `discloud.config` files within a given [directory].
///
/// An optional [onError] handler can be provided to manage errors during file listing.
Stream<File> listDiscloudConfigFiles(
  Directory directory, [
  Function? onError,
]) async* {
  await for (final entity
      in directory.list(recursive: true).handleError(onError ?? (_) => null)) {
    if (entity is! File || entity.basename != DiscloudConfig.filename) continue;

    yield entity;
  }
}

/// Finds `discloud.config` files that match a specific [appId].
///
/// It searches within the given [directory] and yields a [DiscloudConfig] instance
/// for each matching file.
/// An optional [onError] handler can be provided.
Stream<DiscloudConfig> listDiscloudConfigByAppId(
  Directory directory,
  String appId, [
  Function? onError,
]) async* {
  await for (final file in listDiscloudConfigFiles(directory, onError)) {
    final lines = await file.readAsLines();

    final config = DiscloudConfig(file, lines);

    if (config.appId == appId) yield config;
  }
}
