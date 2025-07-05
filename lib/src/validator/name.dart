// ignore_for_file: public_member_api_docs

part of 'validator.dart';

class DiscloudNameValidator extends DiscloudValidator {
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
