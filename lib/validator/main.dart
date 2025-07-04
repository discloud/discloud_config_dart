part of 'validator.dart';

class _MainValidator extends DiscloudValidator {
  const _MainValidator(super.config);

  @override
  Future<void> validate() async {
    final value = config.main;

    if (value == null) throw ArgumentError.notNull("MAIN");

    if (!await value.exists()) throw Exception("MAIN file not exists");
  }
}
