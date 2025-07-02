import 'package:json_annotation/json_annotation.dart';

class TextToIntConverter extends JsonConverter<int?, dynamic> {
  const TextToIntConverter();

  @override
  fromJson(json) {
    if (json == null) return null;
    if (json is int) return json;
    return int.tryParse("$json");
  }

  @override
  String? toJson(object) {
    if (object == null) return null;
    return "$object";
  }
}
