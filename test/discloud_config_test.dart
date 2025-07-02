import 'dart:io';

import 'package:discloud_config/discloud_config.dart';
import 'package:discloud_config/enum.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart';

void main() {
  test('adds one to input values', () async {
    final current = Directory.current;
    final path = join(current.path, DiscloudConfig.filename);
    final config = await DiscloudConfig.fromPath(path);

    config.set(DiscloudScope.APT, ["canvas", "tools"]);
  });
}
