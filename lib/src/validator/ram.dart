part of 'validator.dart';

/// A validator for the `RAM` property in the Discloud configuration.
class DiscloudRamValidator extends DiscloudValidator {
  /// Creates a new instance of [DiscloudRamValidator].
  const DiscloudRamValidator(super.config);

  @override
  void validate() {
    final value = config.data.RAM;

    if (value == null) return;

    final type = config.data.TYPE;

    final error = RangeError.range(
      value,
      DiscloudRamMinByType.bot.value,
      null,
      DiscloudScope.RAM.name,
    );

    if (type == null) {
      if (value < DiscloudRamMinByType.bot.value) throw error;

      return;
    }

    for (final min in DiscloudRamMinByType.values) {
      if (type != min.name) continue;

      if (value < min.value) throw error;
    }
  }
}
