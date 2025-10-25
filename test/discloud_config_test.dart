import "dart:io";

import "package:discloud_config/discloud_config.dart";
import "package:test/test.dart" as t;

void main() {
  t.group("Discloud Config", () {
    final root = Directory.current;

    t.test("Data handler", () async {
      final tempDir = await root.createTemp("test-");
      t.addTearDown(() => tempDir.delete(recursive: true));

      final config = await DiscloudConfig.fromFileSystemEntity(tempDir);

      await config.setData(const DiscloudConfigData());

      final json = config.data.toJson();

      assert(
        json.isEmpty,
        "Config data has ${json.length} items, "
        "expected empty",
      );

      await config.set(DiscloudScope.AUTORESTART, true);

      t.expect(config.data.AUTORESTART, true);

      await config.delete();

      t.expect(await config.file.exists(), false);
    });
  });
}
