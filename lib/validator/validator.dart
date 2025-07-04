import 'dart:async';

import 'package:discloud_config/constants.dart';
import 'package:discloud_config/discloud_config.dart';

part 'avatar.dart';
part 'main.dart';
part 'name.dart';
part 'ram.dart';
part 'type.dart';
part 'version.dart';

abstract class DiscloudValidator {
  static Future<void> validateAll(DiscloudConfig config) async {
    _AvatarValidator(config).validate();
    _NameValidator(config).validate();
    _VersionValidator(config).validate();

    _TypeValidator(config).validate();
    _RamValidator(config).validate();

    await _MainValidator(config).validate();
  }

  const DiscloudValidator(this.config);

  final DiscloudConfig config;

  FutureOr<void> validate();
}
