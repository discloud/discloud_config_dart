// ignore_for_file: public_member_api_docs

import 'package:json_annotation/json_annotation.dart';

class TextToIntConverter extends JsonConverter<int?, dynamic> {
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
