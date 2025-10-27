import "package:json_annotation/json_annotation.dart";

/// A [JsonConverter] that converts a comma-separated string to a iterable of strings.
class TextToIterableConverter
    extends JsonConverter<Iterable<String>?, dynamic> {
  static final _sepPattern = RegExp(r"\s*,\s*");
  static const _separator = ",";

  /// Creates a new instance of [TextToIterableConverter].
  const TextToIterableConverter();

  @override
  Iterable<String>? fromJson(dynamic json) {
    if (json == null) return null;

    if (json is Iterable<String>) return json;

    if (json is! String) return null;

    return json.split(_sepPattern).where((element) => element.isNotEmpty);
  }

  @override
  String? toJson(Iterable<String>? object) {
    if (object == null) return null;
    return object.join(_separator);
  }
}
