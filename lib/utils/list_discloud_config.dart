import 'dart:io';

import 'package:discloud_config/discloud_config.dart';
import 'package:discloud_config/extensions/file_system_entity.dart';

Stream<File> listDiscloudConfig(Directory directory) async* {
  final listing = directory.list(recursive: true);

  await for (final entity in listing) {
    if (entity is! File) continue;

    if (entity.basename != DiscloudConfig.filename) continue;

    yield entity;

    await Future.delayed(Duration.zero);
  }
}
