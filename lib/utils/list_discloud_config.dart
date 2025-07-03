import 'dart:io';

import 'package:discloud_config/discloud_config.dart';
import 'package:discloud_config/extensions/file_system_entity.dart';

Stream<DiscloudConfig> listDiscloudConfigByAppId(
  Directory directory,
  String appId,
) async* {
  await for (final file in listDiscloudConfigFiles(directory)) {
    final lines = await file.readAsLines();

    final config = DiscloudConfig(file, lines);

    if (config.appId == appId) yield config;
  }
}

Stream<File> listDiscloudConfigFiles(Directory directory) async* {
  await for (final entity in directory.list(recursive: true)) {
    if (entity is! File) continue;

    if (entity.basename != DiscloudConfig.filename) continue;

    yield entity;

    await Future.delayed(Duration.zero);
  }
}
