part of 'validator.dart';

class _VersionValidator extends DiscloudValidator {
  static final _versionPattern = RegExp(
    r"^(current|latest|lts|suja|(?:\d+(?:\.(?:\d+|x)){0,2}))$",
  );

  const _VersionValidator(super.config);

  @override
  void validate() {
    final value = config.data.VERSION;

    if (value == null) return;

    if (!_versionPattern.hasMatch(value)) {
      throw ArgumentError.value(value, DiscloudScope.VERSION.name);
    }
  }
}
