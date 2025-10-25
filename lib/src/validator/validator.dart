import "dart:async";

import "package:discloud_config/src/constants.dart";
import "package:discloud_config/src/discloud_config.dart";
import "package:discloud_config/src/scopes.dart";

part "avatar.dart";
part "main.dart";
part "name.dart";
part "ram.dart";
part "type.dart";
part "version.dart";

/// An abstract base class for Discloud configuration validators.
abstract class DiscloudValidator {
  /// Validates all aspects of the given [config].
  static Future<void> validateAll(DiscloudConfig config) async {
    DiscloudAvatarValidator(config).validate();
    DiscloudNameValidator(config).validate();
    DiscloudVersionValidator(config).validate();

    DiscloudTypeValidator(config).validate();
    DiscloudRamValidator(config).validate();

    await DiscloudMainValidator(config).validate();
  }

  /// Creates a new instance of [DiscloudValidator].
  const DiscloudValidator(this.config);

  /// The Discloud configuration to be validated.
  final DiscloudConfig config;

  /// Performs the validation logic.
  FutureOr<void> validate();
}
