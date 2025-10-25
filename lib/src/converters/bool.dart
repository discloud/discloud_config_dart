import "package:json_annotation/json_annotation.dart";

/// A [JsonConverter] that converts a `String` or `bool` to a `bool`.
class TextToBoolConverter extends JsonConverter<bool?, dynamic> {
  static const _false = "false";
  static const _true = "true";
  static const _bools = {_false, _true};

  /// Creates a new instance of [TextToBoolConverter].
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
