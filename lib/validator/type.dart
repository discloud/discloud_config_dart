part of 'validator.dart';

class _TypeValidator extends DiscloudValidator {
  const _TypeValidator(super.config);

  @override
  void validate() {
    final value = config.data.TYPE;

    if (value == null) return;

    if (!discloudTypeValues.contains(value)) throw ArgumentError.value(value);
  }
}
