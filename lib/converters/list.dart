import 'package:json_annotation/json_annotation.dart';

class TextToListConverter extends JsonConverter<List<String>?, dynamic> {
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
    if (object == null) return null;
    return object.join(_separator);
  }
}
