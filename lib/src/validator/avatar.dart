part of 'validator.dart';

class DiscloudAvatarValidator extends DiscloudValidator {
  const DiscloudAvatarValidator(super.config);

  @override
  void validate() {
    final value = config.data.AVATAR;

    if (value == null) return;

    Uri.parse(value);
  }
}
