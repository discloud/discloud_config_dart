import "package:discloud_config/src/comments/comments.dart";
import "package:discloud_config/src/parser.dart";
import "package:test/test.dart" as t;

void main() {
  t.test("Testing Parser", () {
    final inlineCommentRepository = InlineCommentRepository();
    final parser = DiscloudConfigParser(
      inlineCommentRepository: inlineCommentRepository,
    );

    const lines = ["# first comment", "ID=te=st # second comment", "MAIN=main"];

    final Map<String, dynamic> rawData = parser.parseLines(lines);

    t.expect(rawData["ID"], "te=st");
    t.expect(rawData["MAIN"], "main");
  });
}
