import 'dart:io';

import 'package:discloud_config/src/data.dart';
import 'package:discloud_config/src/discloud_config.dart';
import 'package:discloud_config/src/scopes.dart';
import 'package:test/test.dart' as t;

void main() {
  t.test("Discloud Config", () async {
    final directory = Directory.current;

    final config = await DiscloudConfig.fromFileSystemEntity(directory);

    await config.setData(const DiscloudConfigData());

    assert(config.data.toJson().isEmpty);

    await config.set(DiscloudScope.AUTORESTART, true);

    assert(config.data.AUTORESTART != null);
    assert(config.data.AUTORESTART!);

    await config.delete();

    assert(!await config.file.exists());
  });
}
