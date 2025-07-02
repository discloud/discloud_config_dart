import 'package:json_annotation/json_annotation.dart';

class TextToIntConverter extends JsonConverter<int?, String?> {
  const TextToIntConverter();

  @override
  int? fromJson(String? json) {
    if (json == null) return null;
    return int.tryParse(json);
  }

  @override
  String? toJson(int? object) {
    if (object == null) return null;
    return "$object";
  }
}
