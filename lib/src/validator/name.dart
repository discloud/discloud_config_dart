part of "validator.dart";

/// A validator for the `NAME` property in the Discloud configuration.
class DiscloudNameValidator extends DiscloudValidator {
  /// Creates a new instance of [DiscloudNameValidator].
  const DiscloudNameValidator(super.config);

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
