import 'package:json_annotation/json_annotation.dart';

class TextToListConverter extends JsonConverter<List<String>, String?> {
  static final _sepPattern = RegExp(r"\s*,\s*");
  static const _separator = ",";

  const TextToListConverter();

  @override
  List<String> fromJson(String? json) {
    if (json == null) return [];

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
  List<String> fromJson(String? json) {
    if (json == null) return [];

    return List.unmodifiable(
      json.split(_sepPattern).where((element) => element.isNotEmpty),
    );
  }
}
