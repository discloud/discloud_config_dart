// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InlineCommentEntity _$InlineCommentEntityFromJson(Map<String, dynamic> json) =>
    InlineCommentEntity(
      line: (json['line'] as num).toInt(),
      character: (json['character'] as num).toInt(),
      content: json['content'] as String,
    );

Map<String, dynamic> _$InlineCommentEntityToJson(
  InlineCommentEntity instance,
) => <String, dynamic>{
  'line': instance.line,
  'character': instance.character,
  'content': instance.content,
};
