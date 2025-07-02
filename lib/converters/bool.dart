import 'package:json_annotation/json_annotation.dart';

class TextToBoolConverter extends JsonConverter<bool?, String?> {
  static const _true = "true";
  static const _bools = {"false", _true};

  const TextToBoolConverter();

  @override
  bool? fromJson(String? json) {
    if (_bools.contains(json)) return json == _true;
    return null;
  }

  @override
  String? toJson(bool? object) {
    if (object == null) return null;
    return "$object";
  }
}
