import 'package:json_annotation/json_annotation.dart';

class TextToBoolConverter extends JsonConverter<bool?, dynamic> {
  static const _false = "false";
  static const _true = "true";
  static const _bools = {_false, _true};

  const TextToBoolConverter();

  @override
  bool? fromJson(dynamic json) {
    if (json is bool) return json;
    if (_bools.contains(json)) return json == _true;
    return null;
  }

  @override
  String? toJson(bool? object) {
    if (object == null) return null;
    return "$object";
  }
}
