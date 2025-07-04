part of 'validator.dart';

class _NameValidator extends DiscloudValidator {
  const _NameValidator(super.config);

  @override
  void validate() {
    final value = config.data.NAME;

    if (value == null) return;

    if (value.length > discloudNameMaxSize) {
      throw RangeError.range(
        value.length,
        null,
        discloudNameMaxSize,
        DiscloudScope.NAME.name,
      );
    }
  }
}
