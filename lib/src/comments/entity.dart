part of 'comments.dart';

@JsonSerializable()
class InlineCommentEntity {
  factory InlineCommentEntity.fromJson(Map<String, dynamic> json) =>
      _$InlineCommentEntityFromJson(json);

  const InlineCommentEntity({
    required this.line,
    required this.character,
    required this.content,
  });

  final int line;
  final int character;
  final String content;

  Map<String, dynamic> toJson() => _$InlineCommentEntityToJson(this);

  @override
  String toString() => content;

  @override
  // ignore: hash_and_equals
  operator ==(other) {
    if (other is String) return other == content;
    if (other is InlineCommentEntity) return other.content == content;
    return other.hashCode == hashCode;
  }
}
