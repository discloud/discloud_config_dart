import 'package:discloud_config/comments/comments.dart';
import 'package:discloud_config/parser.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Testing Parser', () {
    final inlineCommentRepository = InlineCommentRepository();
    final parser = Parser(inlineCommentRepository: inlineCommentRepository);

    const lines = [
      "# first comment"
          "ID=test # second comment",
      "MAIN=main",
    ];

    final rawData = parser.parseLines(lines);

    assert(rawData["ID"] == "test");
    assert(rawData["MAIN"] == "main");
  });
}
