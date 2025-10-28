import "package:json_annotation/json_annotation.dart";

/// A [JsonConverter] that converts a `String` or `int` to an `int`.
class TextToIntConverter extends JsonConverter<int?, dynamic> {
  /// Creates a new instance of [TextToIntConverter].
  const TextToIntConverter();

  @override
  int? fromJson(dynamic json) {
    return switch (json) {
      final int json => json,
      final num json => json.toInt(),
      final String json => int.tryParse(json),
      _ => null,
    };
  }

  @override
  String? toJson(int? object) {
    if (object == null) return null;
    return "$object";
  }
}
