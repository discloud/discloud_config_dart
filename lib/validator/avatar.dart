part of 'validator.dart';

class _AvatarValidator extends DiscloudValidator {
  const _AvatarValidator(super.config);

  @override
  void validate() {
    final value = config.data.AVATAR;

    if (value == null) return;

    Uri.parse(value);
  }
}
