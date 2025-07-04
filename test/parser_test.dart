import 'package:discloud_config/comments/comments.dart';
import 'package:discloud_config/parser.dart';
import 'package:test/test.dart' as t;

void main() {
  t.test('Testing Parser', () {
    final inlineCommentRepository = InlineCommentRepository();
    final parser = Parser(inlineCommentRepository: inlineCommentRepository);

    const lines = ["# first comment", "ID=test # second comment", "MAIN=main"];

    final rawData = parser.parseLines(lines);

    t.expect(rawData["ID"], "test");
    t.expect(rawData["MAIN"], "main");
  });
}
