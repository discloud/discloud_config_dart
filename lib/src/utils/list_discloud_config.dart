// ignore_for_file: public_member_api_docs

import 'dart:async';
import 'dart:io';

import 'package:discloud_config/src/discloud_config.dart';
import 'package:discloud_config/src/extensions/file_system_entity.dart';

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
