// ignore_for_file: public_member_api_docs

part of 'validator.dart';

class DiscloudMainValidator extends DiscloudValidator {
  const DiscloudMainValidator(super.config);

  @override
  Future<void> validate() async {
    final value = config.main;

    if (value == null) throw ArgumentError.notNull(DiscloudScope.MAIN.name);

    final access = await value.open();

    await access.close();
  }
}
