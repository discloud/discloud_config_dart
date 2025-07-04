part of 'comments.dart';

class InlineCommentRepository {
  /// `(?<content>\s*#.*$)`
  static final pattern = RegExp(r"(?<content>\s*#.*$)");

  InlineCommentRepository();

  /// `Map<line, Comment>`
  final Map<int, InlineCommentEntity> _cache = {};

  int get size => _cache.length;

  bool get isEmpty => _cache.isEmpty;

  bool get isNotEmpty => _cache.isNotEmpty;

  void clear() => _cache.clear();

  bool delete(int line) => _cache.remove(line) != null;

  InlineCommentEntity? get(int line) => _cache[line];

  String? parse(int line, String content) {
    final match = pattern.firstMatch(content);

    if (match == null) return content;

    set(line, match.start, match[0]!);

    if (match.start < 1) return null;

    return content.substring(0, match.start);
  }

  void set(int line, int character, String content) {
    _cache[line] = InlineCommentEntity(
      line: line,
      character: character,
      content: content,
    );
  }

  void write(List<String> lines) {
    if (isEmpty) return;

    for (final comment in values) {
      if (comment.character > 0) {
        lines[comment.line] += comment.content;
        continue;
      }

      lines.insert(comment.line, comment.content);
    }
  }

  Iterable<InlineCommentEntity> get values sync* {
    yield* _cache.values;
  }

  InlineCommentEntity? operator [](int line) => _cache[line];
}
