import 'package:discloud_config/comments.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Testing InlineCommentRepository', () {
    final inlineCommentRepository = InlineCommentRepository();

    const rawLines = ["# first comment", "ID=test # second comment"];
    const parsedLines = [null, "ID=test"];
    const comments = [
      InlineCommentEntity(line: 0, character: 0, content: "# first comment"),
      InlineCommentEntity(line: 1, character: 7, content: " # second comment"),
    ];

    for (int i = 0; i < rawLines.length; i++) {
      assert(inlineCommentRepository.size == i);

      final line = inlineCommentRepository.parse(i, rawLines[i]);

      assert(line == parsedLines[i]);
      assert(inlineCommentRepository.size == i + 1);

      final actual = inlineCommentRepository.get(i)!;
      final expected = comments[i];

      assert(actual.line == expected.line);
      assert(actual.character == expected.character);
      assert(actual.content == expected.content);
    }

    assert(inlineCommentRepository.isNotEmpty);

    /// Must be modifiable list to write comments
    final postLines = ["ID=test"];

    inlineCommentRepository.write(postLines);

    assert(postLines.length == rawLines.length);

    for (int i = 0; i < postLines.length; i++) {
      final actual = postLines[i];
      final expected = rawLines[i];

      assert(actual == expected);
    }

    inlineCommentRepository.clear();
    assert(inlineCommentRepository.isEmpty);
  });
}
