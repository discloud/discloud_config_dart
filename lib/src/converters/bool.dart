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
    return switch (json) {
      final bool json => json,
      final String json => _bools.contains(json) ? json == _true : null,
      _ => null,
    };
  }

  @override
  String? toJson(bool? object) {
    if (object == null) return null;
    return "$object";
  }
}
