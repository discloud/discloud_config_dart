import "package:json_annotation/json_annotation.dart";

/// A [JsonConverter] that converts a comma-separated string to a list of strings.
class TextToListConverter extends JsonConverter<List<String>?, dynamic> {
  static final _sepPattern = RegExp(r"\s*,\s*");
  static const _separator = ",";

  /// Creates a new instance of [TextToListConverter].
  const TextToListConverter();

  @override
  List<String>? fromJson(dynamic json) {
    if (json == null) return null;

    if (json is List<String>) return json;

    if (json is Iterable<String>) return json.toList();

    if (json is! String) return null;

    return json
        .split(_sepPattern)
        .where((element) => element.isNotEmpty)
        .toList();
  }

  @override
  String? toJson(List<String>? object) {
    if (object == null) return null;
    return object.join(_separator);
  }
}
