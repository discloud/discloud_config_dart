import 'package:discloud_config/src/comments/comments.dart';

/// A parser for handling `discloud.config` files.
///
/// This class is responsible for parsing the content of a `discloud.config`
/// file into a map of key-value pairs, and for converting a map of
/// configuration data back into a string that can be written to a file.
class DiscloudConfigParser {
  static final _lineBreakPattern = RegExp(r"[\r\n]+");
  static const _lineBreakSymbol = "\n";
  static const _assignmentSymbol = "=";

  /// Creates a new instance of [DiscloudConfigParser].
  const DiscloudConfigParser({
    required InlineCommentRepository inlineCommentRepository,
  }) : _inlineCommentRepository = inlineCommentRepository;

  final InlineCommentRepository _inlineCommentRepository;

  /// Parses the content of a configuration file as a string.
  ///
  /// The [content] is split into lines and then parsed by [parseLines].
  Map<String, dynamic> parseContent<T>(String content) {
    final lines = content.split(_lineBreakPattern);
    return parseLines(lines);
  }

  /// Parses a list of lines from a configuration file.
  ///
  /// Each line is parsed into a key-value pair.
  ///
  /// Blank lines and comments are ignored.
  Map<String, dynamic> parseLines<T>(List<String> lines) {
    final parsed = Map<String, dynamic>.fromEntries(_parseLines(lines));
    return parsed;
  }

  /// Converts a map of configuration data into a string.
  ///
  /// The [data] is converted into a list of lines, where each line is a
  /// key-value pair separated by an assignment symbol.
  String stringify(Map<String, dynamic> data) {
    final List<String> lines = [];

    for (final entry in data.entries) {
      final line = "${entry.key}$_assignmentSymbol${entry.value}";

      lines.add(line);
    }

    _inlineCommentRepository.write(lines);

    return lines.join(_lineBreakSymbol);
  }

  Iterable<MapEntry<String, String>> _parseLines(List<String> lines) sync* {
    _inlineCommentRepository.clear();

    for (int i = 0; i < lines.length; i++) {
      final String rawLine = lines[i].trimRight();

      final line = _inlineCommentRepository.parse(i, rawLine);

      if (line == null) continue;

      final parts = line.split(_assignmentSymbol);

      yield MapEntry(parts[0], parts[1]);
    }
  }
}
