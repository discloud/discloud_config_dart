# Discloud Config

[![pub package](https://img.shields.io/pub/v/discloud_config.svg)](https://pub.dev/packages/discloud_config)
[![package publisher](https://img.shields.io/pub/publisher/discloud_config.svg)](https://pub.dev/packages/discloud_config/publisher)

A configuration file handler to use with Discloud host

## Useful links

- [Discloud](https://discloud.com)
- [Discloud Docs](https://docs.discloud.com/en)
- [Discloud Config Docs](https://docs.discloudbot.com/discloud.config)

[![Discord](https://discord.com/api/guilds/584490943034425391/widget.png?style=banner2)](https://discord.gg/discloud)

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
