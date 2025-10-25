part of "validator.dart";

/// A validator for the `VERSION` property in the Discloud configuration.
class DiscloudVersionValidator extends DiscloudValidator {
  static final _versionPattern = RegExp(
    r"^(current|latest|lts|suja|(?:\d+(?:\.(?:\d+|x)){0,2}))$",
  );

  /// Creates a new instance of [DiscloudVersionValidator].
  const DiscloudVersionValidator(super.config);

  @override
  void validate() {
    final value = config.data.VERSION;

    if (value == null || value.isEmpty) return;

    if (!_versionPattern.hasMatch(value)) {
      throw ArgumentError.value(value, DiscloudScope.VERSION.name);
    }
  }
}
