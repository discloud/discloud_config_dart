<!-- markdownlint-disable MD041 -->

[![pub package](https://img.shields.io/pub/v/discloud_config.svg)][package_config]
[![package publisher](https://img.shields.io/pub/publisher/discloud_config.svg)][package_config_publisher]

A configuration file handler to use with Discloud host

## Useful links

- [Discloud](https://discloud.com)
- [Discloud Docs](https://docs.discloud.com)
- [Discloud Config Docs](https://docs.discloudbot.com/discloud.config)

[![Discord](https://discord.com/api/guilds/584490943034425391/widget.png?style=banner2)](https://discord.gg/discloud)

## Installation

Add it to your [`pubspec.yaml`][pubspec] as a [dependencies] by running the following command.

```console
dart pub add discloud_config
```

## Usage

### Import

```dart
import 'package:discloud_config/discloud_config.dart
```

### Make an instance

```dart
/// the [lines] argument receives a list of lines from the configuration file contents
DiscloudConfig(File, [List<String>?]);
```

- It can also be asynchronous

```dart
// import 'dart:io';
await DiscloudConfig.fromFileSystemEntity(FileSystemEntity);
```

```dart
await DiscloudConfig.fromPath(String);
```

```dart
await DiscloudConfig.fromUri(Uri);
```

### Watch configuration file

- `DiscloudConfigData` is read-only, see [`Updating DiscloudConfigData`](#updating-discloudconfigdata)
- It works until the file is `moved` or `deleted`

```dart
// Stream<DiscloudConfigData>
await for (final DiscloudConfigData data in config.watch()) {
  // ...
}
```

### Create a new DiscloudConfigData from JSON

```dart
DiscloudConfigData.fromJson(Map<String, dynamic>);
```

### Updating DiscloudConfigData

```dart
// Convert to raw data
final Map<String, dynamic> oldRawData = oldData.toJson();

// Update raw data
oldRawData["TYPE"] = "bot";

// Convert to data
final newData = DiscloudConfigData.fromJson(oldRawData);
```

### List all configuration files recursively

```dart
// Stream<File>
await for (final File file in listDiscloudConfigFiles(Directory)) {
  // ...
}
```

### Recursively list configuration structures by ID

```dart
// Stream<DiscloudConfig>
await for (final DiscloudConfig config in listDiscloudConfigByAppId(Directory, String)) {
  // ...
}
```

## Contributing

We welcome a diverse set of contributions, including, but not limited to:

- [Filing bugs and feature requests][file_an_issue]
- [Send a pull request][pull_request]
- Or, create something awesome using this API and share with us and others!

For the stability of the API and existing users, consider opening an issue
first before implementing a large new feature or breaking an API. For smaller
changes (like documentation, minor bug fixes), just send a pull request.

[package_config]: https://pub.dev/packages/discloud_config
[package_config_publisher]: https://pub.dev/packages/discloud_config/publisher
[pubspec]: https://dart.dev/tools/pub/pubspec
[file_an_issue]: https://github.com/discloud/discloud_config_dart/issues/new
[pull_request]: https://github.com/discloud/discloud_config_dart/pulls
