import "dart:io";

import "package:discloud_config/src/extensions/file.dart";
import "package:path/path.dart";
import "package:test/test.dart" as t;

void main() async {
  final root = Directory.current;

  const content1 = "abcdefghijklmnopqrstuvwxyz";
  const content2 = "123456789";
  const content3 = "$content1$content2";

  t.test("File Atomic Writing", () async {
    final tempDir = await root.createTemp("test-");

    final file = File(joinAll([tempDir.path, "file.txt"]));

    t.addTearDown(() => tempDir.delete(recursive: true));

    await file.writeAsString(content1, flush: true);

    t.expect(await file.readAsString(), content1);

    await file.writeAsStringAtomically(content3);

    t.expect(await file.readAsString(), content3);
  });
}
