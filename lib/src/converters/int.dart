import "package:json_annotation/json_annotation.dart";

/// A [JsonConverter] that converts a `String` or `int` to an `int`.
class TextToIntConverter extends JsonConverter<int?, dynamic> {
  /// Creates a new instance of [TextToIntConverter].
  const TextToIntConverter();

  @override
  int? fromJson(dynamic json) {
    if (json == null) return null;
    if (json is int) return json;
    return int.tryParse("$json");
  }

  @override
  String? toJson(int? object) {
    if (object == null) return null;
    return "$object";
  }
}
