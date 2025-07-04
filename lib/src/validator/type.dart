part of 'validator.dart';

class DiscloudTypeValidator extends DiscloudValidator {
  const DiscloudTypeValidator(super.config);

  @override
  void validate() {
    final value = config.data.TYPE;

    if (value == null || value.isEmpty) return;

    try {
      DiscloudAppType.values.byName(value);
    } catch (_) {
      throw ArgumentError.value(value, DiscloudScope.TYPE.name);
    }
  }
}
