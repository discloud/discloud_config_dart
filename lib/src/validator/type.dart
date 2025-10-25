part of "validator.dart";

/// A validator for the `TYPE` property in the Discloud configuration.
class DiscloudTypeValidator extends DiscloudValidator {
  /// Creates a new instance of [DiscloudTypeValidator].
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
