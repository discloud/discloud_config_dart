import "dart:async";
import "dart:io";

import "package:discloud_config/src/discloud_config.dart";
import "package:discloud_config/src/extensions/file_system_entity.dart";
import "package:discloud_config/src/utils/file_list_search.dart";

/// Lists all `discloud.config` files within a given [directory].
///
/// An optional [onError] handler can be provided to manage errors during file listing.
Stream<File> listDiscloudConfigFiles(Directory directory, [Function? onError]) {
  return fileListSearch(
    directory,
    (file) => file.basename == DiscloudConfig.filename,
    onError,
  );
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
    final config = await DiscloudConfig.fromFileSystemEntity(file);

    if (config.appId == appId) yield config;
  }
}
