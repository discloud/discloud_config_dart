import 'package:discloud_config/comments/comments.dart';
import 'package:test/test.dart' as t;

void main() {
  t.test('Testing InlineCommentRepository', () {
    final inlineCommentRepository = InlineCommentRepository();

    const rawLines = ["# first comment", "ID=test # second comment"];
    const parsedLines = [null, "ID=test"];
    const comments = [
      InlineCommentEntity(line: 0, character: 0, content: "# first comment"),
      InlineCommentEntity(line: 1, character: 7, content: " # second comment"),
    ];

    for (int i = 0; i < rawLines.length; i++) {
      t.expect(inlineCommentRepository.size, i);

      final line = inlineCommentRepository.parse(i, rawLines[i]);

      t.expect(line, parsedLines[i]);
      t.expect(inlineCommentRepository.size, i + 1);

      final actual = inlineCommentRepository[i]!;
      final expected = comments[i];

      t.expect(actual.line, expected.line);
      t.expect(actual.character, expected.character);
      t.expect(actual.content, expected.content);
    }

    assert(inlineCommentRepository.isNotEmpty);

    /// Must be modifiable list to write comments
    final postLines = ["ID=test"];

    inlineCommentRepository.write(postLines);

    t.expect(postLines.length, rawLines.length);

    for (int i = 0; i < postLines.length; i++) {
      final actual = postLines[i];
      final expected = rawLines[i];

      t.expect(actual, expected);
    }

    inlineCommentRepository.clear();
    assert(inlineCommentRepository.isEmpty);
  });
}
