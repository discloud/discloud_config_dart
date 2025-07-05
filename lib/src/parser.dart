// ignore_for_file: public_member_api_docs

import 'package:discloud_config/src/comments/comments.dart';

class DiscloudConfigParser {
  static final _lineBreakPattern = RegExp(r"[\r\n]+");
  static const _lineBreakSymbol = "\n";
  static const _assignmentSymbol = "=";

  const DiscloudConfigParser({
    required InlineCommentRepository inlineCommentRepository,
  }) : _inlineCommentRepository = inlineCommentRepository;

  final InlineCommentRepository _inlineCommentRepository;

  Map<String, dynamic> parseContent<T>(String content) {
    final lines = content.split(_lineBreakPattern);
    return parseLines(lines);
  }

  Map<String, dynamic> parseLines<T>(List<String> lines) {
    final parsed = Map<String, dynamic>.fromEntries(_parseLines(lines));
    return parsed;
  }

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
