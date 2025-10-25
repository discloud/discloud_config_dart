import "dart:io";
import "dart:math";

import "package:discloud_config/src/discloud_config.dart";
import "package:discloud_config/src/validator/validator.dart";
import "package:path/path.dart";
import "package:test/test.dart" as t;

Future<void> writeFile(File file, String contents) {
  return file.writeAsString(contents, flush: true);
}

void main() {
  final file = File(join(Directory.current.path, "discloud.config"));
  final random = Random();

  t.group("Validator", () {
    t.group("AVATAR", () {
      t.test("Null", () async {
        final config = await DiscloudConfig.fromFileSystemEntity(file);

        t.expect(config.data.AVATAR, null);

        DiscloudAvatarValidator(config).validate();
      });

      t.test("Empty", () async {
        const value = "";

        await writeFile(file, "AVATAR=");

        final config = await DiscloudConfig.fromFileSystemEntity(file);

        t.expect(config.data.AVATAR, value);

        DiscloudAvatarValidator(config).validate();
      });

      t.test("Invalid", () async {
        const value = "::Not valid URI::";

        await writeFile(file, "AVATAR=$value");

        final config = await DiscloudConfig.fromFileSystemEntity(file);

        t.expect(config.data.AVATAR, value);

        t.expect(
          () => DiscloudAvatarValidator(config).validate(),
          t.throwsA(t.isA<Exception>()),
        );
      });
    });

    t.group("MAIN", () {
      t.test("Null", () async {
        final config = await DiscloudConfig.fromFileSystemEntity(file);

        t.expect(config.data.MAIN, null);
        t.expect(config.main, null);

        t.expect(
          () => DiscloudMainValidator(config).validate(),
          t.throwsA(t.isA<ArgumentError>()),
        );
      });

      t.test("Empty (Null)", () async {
        const value = "";

        await writeFile(file, "MAIN=$value");

        final config = await DiscloudConfig.fromFileSystemEntity(file);

        t.expect(config.data.MAIN, value);
        t.expect(config.main, null);

        t.expect(
          () => DiscloudMainValidator(config).validate(),
          t.throwsA(t.isA<ArgumentError>()),
        );
      });

      t.test("Not found", () async {
        final value = "${random.nextDouble()}";

        await writeFile(file, "MAIN=$value");

        final config = await DiscloudConfig.fromFileSystemEntity(file);

        t.expect(config.data.MAIN, value);
        t.expect(config.main, t.isA<File>());

        t.expect(
          () => DiscloudMainValidator(config).validate(),
          t.throwsA(t.isA<PathNotFoundException>()),
        );
      });
    });

    t.group("NAME", () {
      t.test("Null", () async {
        final config = await DiscloudConfig.fromFileSystemEntity(file);

        t.expect(config.data.NAME, null);

        DiscloudNameValidator(config).validate();
      });

      t.test("Empty", () async {
        const value = "";

        await writeFile(file, "NAME=$value");

        final config = await DiscloudConfig.fromFileSystemEntity(file);

        t.expect(config.data.NAME, value);

        DiscloudNameValidator(config).validate();
      });

      t.test("Invalid range", () async {
        const value = "1234567890 1234567890 1234567890"; // length `32`

        await writeFile(file, "NAME=$value");

        final config = await DiscloudConfig.fromFileSystemEntity(file);

        t.expect(config.data.NAME, value);

        t.expect(
          () => DiscloudNameValidator(config).validate(),
          t.throwsA(t.isA<RangeError>()),
        );
      });
    });

    t.group("RAM", () {
      t.test("Null", () async {
        final config = await DiscloudConfig.fromFileSystemEntity(file);

        t.expect(config.data.RAM, null);

        DiscloudRamValidator(config).validate();
      });

      t.test("Empty", () async {
        final config = await DiscloudConfig.fromFileSystemEntity(file);

        t.expect(config.data.RAM, null);

        DiscloudRamValidator(config).validate();
      });

      t.test("Invalid range", () async {
        const value = 0;

        await writeFile(file, "RAM=$value");

        final config = await DiscloudConfig.fromFileSystemEntity(file);

        t.expect(config.data.RAM, value);

        t.expect(
          () => DiscloudRamValidator(config).validate(),
          t.throwsA(t.isA<RangeError>()),
        );
      });
    });

    t.group("TYPE", () {
      t.test("Null", () async {
        final config = await DiscloudConfig.fromFileSystemEntity(file);

        t.expect(config.data.TYPE, null);

        DiscloudTypeValidator(config).validate();
      });

      t.test("Empty", () async {
        const value = "";

        await writeFile(file, "TYPE=$value");

        final config = await DiscloudConfig.fromFileSystemEntity(file);

        t.expect(config.data.TYPE, value);

        DiscloudTypeValidator(config).validate();
      });

      t.test("Invalid", () async {
        const value = "_";

        await writeFile(file, "TYPE=$value");

        final config = await DiscloudConfig.fromFileSystemEntity(file);

        t.expect(config.data.TYPE, value);

        t.expect(
          () => DiscloudTypeValidator(config).validate(),
          t.throwsA(t.isA<ArgumentError>()),
        );
      });
    });

    t.group("VERSION", () {
      t.test("Null", () async {
        final config = await DiscloudConfig.fromFileSystemEntity(file);

        t.expect(config.data.VERSION, null);

        DiscloudVersionValidator(config).validate();
      });

      t.test("Empty", () async {
        const value = "";

        await writeFile(file, "VERSION=$value");

        final config = await DiscloudConfig.fromFileSystemEntity(file);

        t.expect(config.data.VERSION, value);

        DiscloudVersionValidator(config).validate();
      });

      t.test("Invalid", () async {
        const value = "_";

        await writeFile(file, "VERSION=$value");

        final config = await DiscloudConfig.fromFileSystemEntity(file);

        t.expect(config.data.VERSION, value);

        t.expect(
          () => DiscloudVersionValidator(config).validate(),
          t.throwsA(t.isA<ArgumentError>()),
        );
      });

      t.test("Valid semver (0)", () async {
        const value = "0";

        await writeFile(file, "VERSION=$value");

        final config = await DiscloudConfig.fromFileSystemEntity(file);

        t.expect(config.data.VERSION, value);

        DiscloudVersionValidator(config).validate();
      });

      t.test("Valid semver (0.0)", () async {
        const value = "0.0";

        await writeFile(file, "VERSION=$value");

        final config = await DiscloudConfig.fromFileSystemEntity(file);

        t.expect(config.data.VERSION, value);

        DiscloudVersionValidator(config).validate();
      });

      t.test("Valid semver (0.0.0)", () async {
        const value = "0.0.0";

        await writeFile(file, "VERSION=$value");

        final config = await DiscloudConfig.fromFileSystemEntity(file);

        t.expect(config.data.VERSION, value);

        DiscloudVersionValidator(config).validate();
      });

      t.test("Invalid semver (0.0.0.0)", () async {
        const value = "0.0.0.0";

        await writeFile(file, "VERSION=$value");

        final config = await DiscloudConfig.fromFileSystemEntity(file);

        t.expect(config.data.VERSION, value);

        t.expect(
          () => DiscloudVersionValidator(config).validate(),
          t.throwsA(t.isA<ArgumentError>()),
        );
      });
    });
  });
}
