// ignore_for_file: public_member_api_docs

part of 'comments.dart';

/// A repository for managing inline comments within the configuration file.
class InlineCommentRepository {
  /// A regular expression pattern to identify inline comments, which start with `#`.
  ///
  /// Pattern: `(?<content>\s*#.*$)`
  static final pattern = RegExp(r"(?<content>\s*#.*$)");

  /// Creates a new instance of [InlineCommentRepository].
  InlineCommentRepository();

  /// A cache of comments, mapping the line number to the [InlineCommentEntity].
  final Map<int, InlineCommentEntity> _cache = {};

  /// The number of comments currently stored in the repository.
  int get size => _cache.length;

  /// Returns `true` if there are no comments stored.
  bool get isEmpty => _cache.isEmpty;

  /// Returns `true` if there are comments stored.
  bool get isNotEmpty => _cache.isNotEmpty;

  /// Clears all comments from the repository.
  void clear() => _cache.clear();

  /// Deletes a comment at the specified [line] number.
  ///
  /// Returns `true` if a comment was successfully deleted.
  bool delete(int line) => _cache.remove(line) != null;

  /// Retrieves a comment at the specified [line] number.
  InlineCommentEntity? get(int line) => _cache[line];

  /// Parses a line of content, extracts the comment, and stores it.
  ///
  /// Returns the content of the line without the comment.
  String? parse(int line, String content) {
    final match = pattern.firstMatch(content);

    if (match == null) return content;

    set(line, match.start, match[0]!);

    if (match.start < 1) return null;

    return content.substring(0, match.start);
  }

  /// Sets a comment at a specific [line] and [character] position.
  void set(int line, int character, String content) {
    _cache[line] = InlineCommentEntity(
      line: line,
      character: character,
      content: content,
    );
  }

  /// Writes the stored comments back into a list of lines.
  void write(List<String> lines) {
    if (isEmpty) return;

    for (final comment in _cache.values) {
      if (comment.character > 0) {
        lines[comment.line] += comment.content;
        continue;
      }

      lines.insert(comment.line, comment.content);
    }
  }

  /// An iterable of all stored comment values.
  Iterable<InlineCommentEntity> get values sync* {
    yield* _cache.values;
  }

  /// Retrieves a comment at the specified [line] number using the index operator.
  InlineCommentEntity? operator [](int line) => _cache[line];
}
