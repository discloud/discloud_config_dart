part of 'comments.dart';

class InlineCommentRepository {
  static const char = "#";

  /// `[\r\n]+`
  static final lineBreakPattern = RegExp(r"[\r\n]+");

  /// `(?<content>\s*#.*$)`
  static final pattern = RegExp(r"(?<content>\s*#.*$)");

  /// `Map<line, Map<character, Comment>>`
  final Map<int, InlineCommentEntity> _cache = {};

  int get size {
    return _cache.length;
  }

  bool get isEmpty {
    return _cache.isEmpty;
  }

  bool get isNotEmpty {
    return _cache.isNotEmpty;
  }

  void clear() {
    _cache.clear();
  }

  bool delete(int line) {
    return _cache.remove(line) != null;
  }

  InlineCommentEntity? get(int line) {
    return _cache[line];
  }

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
}
