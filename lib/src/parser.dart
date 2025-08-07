import 'dart:convert';

import 'package:discloud_config/src/comments/comments.dart';

/// A parser for handling `discloud.config` files.
///
/// This class is responsible for parsing the content of a `discloud.config`
/// file into a map of key-value pairs, and for converting a map of
/// configuration data back into a string that can be written to a file.
///
/// It also handles inline comments, preserving them during parsing and
/// stringifying.
class DiscloudConfigParser {
  static const _lineBreakSymbol = "\n";
  static const _assignmentSymbol = "=";

  /// Creates a new instance of [DiscloudConfigParser].
  ///
  /// Requires an [InlineCommentRepository] to handle comments.
  const DiscloudConfigParser({
    required InlineCommentRepository inlineCommentRepository,
  }) : _inlineCommentRepository = inlineCommentRepository;

  final InlineCommentRepository _inlineCommentRepository;

  /// Parses the content of a configuration file as a string.
  ///
  /// The [content] is split into lines and then parsed by [parseLines].
  /// This is useful when you have the entire file content as a single string.
  Map<String, dynamic> parseContent<T>(String content) {
    final lines = const LineSplitter().convert(content);
    return parseLines(lines);
  }

  /// Parses a list of lines from a configuration file.
  ///
  /// Each line is parsed into a key-value pair. Blank lines and comments are
  /// ignored. This method is ideal for processing a file line by line.
  Map<String, dynamic> parseLines<T>(Iterable<String> lines) {
    final parsed = Map<String, dynamic>.fromEntries(_parseLines(lines));
    return parsed;
  }

  /// Converts a map of configuration data into a string.
  ///
  /// The [data] is converted into a list of lines, where each line is a
  /// key-value pair separated by an assignment symbol. Comments are also
  /// preserved.
  String stringify(Map<String, dynamic> data) {
    final List<String> lines = [];

    for (final entry in data.entries) {
      final line = "${entry.key}$_assignmentSymbol${entry.value}";

      lines.add(line);
    }

    _inlineCommentRepository.write(lines);

    return lines.join(_lineBreakSymbol);
  }

  /// Internal method to parse lines and yield key-value pairs.
  ///
  /// This method also handles the parsing of inline comments.
  Iterable<MapEntry<String, String>> _parseLines(Iterable<String> lines) sync* {
    _inlineCommentRepository.clear();

    for (final (i, rawLine) in lines.indexed) {
      final line = _inlineCommentRepository.parse(i, rawLine.trimRight());

      if (line == null) continue;

      final parts = line.split(_assignmentSymbol);

      yield MapEntry(parts[0], parts[1]);
    }
  }
}