part of "validator.dart";

/// A validator for the `RAM` property in the Discloud configuration.
class DiscloudRamValidator extends DiscloudValidator {
  /// Creates a new instance of [DiscloudRamValidator].
  const DiscloudRamValidator(super.config);

  @override
  void validate() {
    final value = config.data.RAM;

    if (value == null) return;

    final type = config.data.appTYPE;

    final min = DiscloudRamMinByType.values.byName(type.name);

    if (value < min.value) {
      throw RangeError.range(
        value,
        DiscloudRamMinByType.bot.value,
        null,
        DiscloudScope.RAM.name,
      );
    }
  }
}
