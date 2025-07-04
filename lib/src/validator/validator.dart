import 'dart:async';

import 'package:discloud_config/src/constants.dart';
import 'package:discloud_config/src/discloud_config.dart';
import 'package:discloud_config/src/scopes.dart';

part 'avatar.dart';
part 'main.dart';
part 'name.dart';
part 'ram.dart';
part 'type.dart';
part 'version.dart';

abstract class DiscloudValidator {
  static Future<void> validateAll(DiscloudConfig config) async {
    DiscloudAvatarValidator(config).validate();
    DiscloudNameValidator(config).validate();
    DiscloudVersionValidator(config).validate();

    DiscloudTypeValidator(config).validate();
    DiscloudRamValidator(config).validate();

    await DiscloudMainValidator(config).validate();
  }

  const DiscloudValidator(this.config);

  final DiscloudConfig config;

  FutureOr<void> validate();
}
