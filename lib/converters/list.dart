import 'package:json_annotation/json_annotation.dart';

class TextToListConverter extends JsonConverter<List<String>, dynamic> {
  static final _sepPattern = RegExp(r"\s*,\s*");
  static const _separator = ",";

  const TextToListConverter();

  @override
  fromJson(json) {
    if (json == null) return [];

    if (json is List<String>) return json;

    if (json is! String) return [];

    return json
        .split(_sepPattern)
        .where((element) => element.isNotEmpty)
        .toList();
  }

  @override
  String? toJson(object) {
    if (object.isEmpty) return null;
    return object.join(_separator);
  }
}

class TextToUnmodifiableListConverter extends TextToListConverter {
  static final _sepPattern = RegExp(r"\s*,\s*");

  const TextToUnmodifiableListConverter();

  @override
  fromJson(json) {
    if (json == null) return List.unmodifiable([]);

    if (json is List<String>) return json;

    if (json is! String) return List.unmodifiable([]);

    return List.unmodifiable(
      json.split(_sepPattern).where((element) => element.isNotEmpty),
    );
  }
}
