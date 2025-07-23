// ignore_for_file: public_member_api_docs

part of 'comments.dart';

/// Represents an inline comment in the configuration file.
@JsonSerializable()
class InlineCommentEntity {
  /// Creates a new instance of [InlineCommentEntity].
  const InlineCommentEntity({
    required this.line,
    required this.character,
    required this.content,
  });

  /// Creates an [InlineCommentEntity] instance from a JSON map.
  factory InlineCommentEntity.fromJson(Map<String, dynamic> json) =>
      _$InlineCommentEntityFromJson(json);

  /// The line number where the comment is located.
  final int line;

  /// The character position where the comment starts.
  final int character;

  /// The content of the comment.
  final String content;

  /// Converts this [InlineCommentEntity] instance to a JSON map.
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
