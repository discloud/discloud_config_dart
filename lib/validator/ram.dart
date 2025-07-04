part of 'validator.dart';

class _RamValidator extends DiscloudValidator {
  const _RamValidator(super.config);

  @override
  void validate() {
    final value = config.data.RAM;

    if (value == null) return;

    final type = config.data.TYPE;

    if (type == null) {
      if (value < DiscloudRamMinByType.bot.value) {
        throw RangeError.range(value, DiscloudRamMinByType.bot.value, null);
      }

      return;
    }

    for (final min in DiscloudRamMinByType.values) {
      if (type != min.name) continue;

      if (value < min.value) {
        throw RangeError.range(value, min.value, null, DiscloudScope.RAM.name);
      }
    }
  }
}
