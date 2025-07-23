part of 'validator.dart';

/// A validator for the `MAIN` file path in the Discloud configuration.
class DiscloudMainValidator extends DiscloudValidator {
  /// Creates a new instance of [DiscloudMainValidator].
  const DiscloudMainValidator(super.config);

  @override
  Future<void> validate() async {
    final value = config.main;

    if (value == null) throw ArgumentError.notNull(DiscloudScope.MAIN.name);

    final access = await value.open();

    await access.close();
  }
}
