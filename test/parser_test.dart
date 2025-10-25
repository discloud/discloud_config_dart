import "package:discloud_config/src/comments/comments.dart";
import "package:discloud_config/src/parser.dart";
import "package:test/test.dart" as t;

void main() {
  t.test("Testing Parser", () {
    final inlineCommentRepository = InlineCommentRepository();
    final parser =
        DiscloudConfigParser(inlineCommentRepository: inlineCommentRepository);

    const lines = ["# first comment", "ID=test # second comment", "MAIN=main"];

    final Map<String, dynamic> rawData = parser.parseLines(lines);

    t.expect(rawData["ID"], "test");
    t.expect(rawData["MAIN"], "main");
  });
}
