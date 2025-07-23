part of 'validator.dart';

/// A validator for the avatar URL in the Discloud configuration.
class DiscloudAvatarValidator extends DiscloudValidator {
  /// Creates a new instance of [DiscloudAvatarValidator].
  const DiscloudAvatarValidator(super.config);

  @override
  void validate() {
    final value = config.data.AVATAR;

    if (value == null) return;

    Uri.parse(value);
  }
}
