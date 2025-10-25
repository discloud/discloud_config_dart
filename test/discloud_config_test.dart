import "dart:io";

import "package:discloud_config/discloud_config.dart";
import "package:test/test.dart" as t;

void main() {
  t.test("Discloud Config", () async {
    final directory = Directory.current;

    final config = await DiscloudConfig.fromFileSystemEntity(directory);

    await config.setData(const DiscloudConfigData());

    assert(config.data.toJson().isEmpty);

    await config.set(DiscloudScope.AUTORESTART, true);

    t.expect(config.data.AUTORESTART, true);

    await config.delete();

    t.expect(await config.file.exists(), false);
  });
}
