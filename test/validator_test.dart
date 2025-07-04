import 'dart:io';
import 'dart:math';

import 'package:discloud_config/discloud_config.dart';
import 'package:discloud_config/validator/validator.dart';
import 'package:path/path.dart';
import 'package:test/test.dart' as t;

void main() {
  final file = File(join(Directory.current.path, "discloud.config"));
  final random = Random();

  t.group("Validator", () {
    t.group("AVATAR", () {
      t.test('Null', () {
        final config = DiscloudConfig(file, const []);

        t.expect(config.data.AVATAR, null);

        DiscloudAvatarValidator(config).validate();
      });

      t.test('Empty', () {
        const value = "";

        final config = DiscloudConfig(file, const ["AVATAR="]);

        t.expect(config.data.AVATAR, value);

        DiscloudAvatarValidator(config).validate();
      });

      t.test('Invalid', () {
        const value = "::Not valid URI::";

        final config = DiscloudConfig(file, const ["AVATAR=$value"]);

        t.expect(config.data.AVATAR, value);

        t.expect(
          () => DiscloudAvatarValidator(config).validate(),
          t.throwsA(t.isA<Exception>()),
        );
      });
    });

    t.group("MAIN", () {
      t.test('Null', () {
        final config = DiscloudConfig(file, const []);

        t.expect(config.data.MAIN, null);

        t.expect(
          () => DiscloudMainValidator(config).validate(),
          t.throwsA(t.isA<ArgumentError>()),
        );
      });

      t.test('Empty (Null)', () {
        const value = "";

        final config = DiscloudConfig(file, const ["MAIN="]);

        t.expect(config.data.MAIN, value);

        t.expect(
          () => DiscloudMainValidator(config).validate(),
          t.throwsA(t.isA<ArgumentError>()),
        );
      });

      t.test('Not found', () {
        final value = "${random.nextDouble()}";

        final config = DiscloudConfig(file, ["MAIN=$value"]);

        t.expect(config.data.MAIN, value);

        t.expect(
          () => DiscloudMainValidator(config).validate(),
          t.throwsA(t.isA<PathNotFoundException>()),
        );
      });
    });

    t.group("NAME", () {
      t.test('Null', () {
        final config = DiscloudConfig(file, const []);

        t.expect(config.data.NAME, null);

        DiscloudNameValidator(config).validate();
      });

      t.test('Empty', () {
        const value = "";

        final config = DiscloudConfig(file, const ["NAME="]);

        t.expect(config.data.NAME, value);

        DiscloudNameValidator(config).validate();
      });

      t.test('Invalid range', () {
        const value = "1234567890 1234567890 1234567890"; // length `32`

        final config = DiscloudConfig(file, const ["NAME=$value"]);

        t.expect(config.data.NAME, value);

        t.expect(
          () => DiscloudNameValidator(config).validate(),
          t.throwsA(t.isA<RangeError>()),
        );
      });
    });

    t.group("RAM", () {
      t.test('Null', () {
        final config = DiscloudConfig(file, const []);

        t.expect(config.data.RAM, null);

        DiscloudRamValidator(config).validate();
      });

      t.test('Empty', () {
        final config = DiscloudConfig(file, const ["RAM="]);

        t.expect(config.data.RAM, null);

        DiscloudRamValidator(config).validate();
      });

      t.test('Invalid range', () {
        const value = 0;

        final config = DiscloudConfig(file, const ["RAM=$value"]);

        t.expect(config.data.RAM, value);

        t.expect(
          () => DiscloudRamValidator(config).validate(),
          t.throwsA(t.isA<RangeError>()),
        );
      });
    });

    t.group("TYPE", () {
      t.test('Null', () {
        final config = DiscloudConfig(file, const []);

        t.expect(config.data.TYPE, null);

        DiscloudTypeValidator(config).validate();
      });

      t.test('Empty', () {
        const value = "";

        final config = DiscloudConfig(file, const ["TYPE="]);

        t.expect(config.data.TYPE, value);

        DiscloudTypeValidator(config).validate();
      });

      t.test('Invalid', () {
        const value = "_";

        final config = DiscloudConfig(file, const ["TYPE=$value"]);

        t.expect(config.data.TYPE, value);

        t.expect(
          () => DiscloudTypeValidator(config).validate(),
          t.throwsA(t.isA<ArgumentError>()),
        );
      });
    });

    t.group("VERSION", () {
      t.test('Null', () {
        final config = DiscloudConfig(file, const []);

        t.expect(config.data.VERSION, null);

        DiscloudVersionValidator(config).validate();
      });

      t.test('Empty', () {
        const value = "";

        final config = DiscloudConfig(file, const ["VERSION="]);

        t.expect(config.data.VERSION, value);

        DiscloudVersionValidator(config).validate();
      });

      t.test('Invalid', () {
        const value = "_";

        final config = DiscloudConfig(file, const ["VERSION=$value"]);

        t.expect(config.data.VERSION, value);

        t.expect(
          () => DiscloudVersionValidator(config).validate(),
          t.throwsA(t.isA<ArgumentError>()),
        );
      });

      t.test('Valid semver (0)', () {
        const value = "0";

        final config = DiscloudConfig(file, const ["VERSION=$value"]);

        t.expect(config.data.VERSION, value);

        DiscloudVersionValidator(config).validate();
      });

      t.test('Valid semver (0.0)', () {
        const value = "0.0";

        final config = DiscloudConfig(file, const ["VERSION=$value"]);

        t.expect(config.data.VERSION, value);

        DiscloudVersionValidator(config).validate();
      });

      t.test('Valid semver (0.0.0)', () {
        const value = "0.0.0";

        final config = DiscloudConfig(file, const ["VERSION=$value"]);

        t.expect(config.data.VERSION, value);

        DiscloudVersionValidator(config).validate();
      });

      t.test('Invalid semver (0.0.0.0)', () {
        const value = "0.0.0.0";

        final config = DiscloudConfig(file, const ["VERSION=$value"]);

        t.expect(config.data.VERSION, value);

        t.expect(
          () => DiscloudVersionValidator(config).validate(),
          t.throwsA(t.isA<ArgumentError>()),
        );
      });
    });
  });
}
