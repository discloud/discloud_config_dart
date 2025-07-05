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

### List all configuration files recursively

```dart
// `Stream<File> listDiscloudConfigFiles`
await for (final File file in listDiscloudConfigFiles(directory)) {
  // ...
}
```

### Recursively list configuration structures by ID

```dart
// `Stream<DiscloudConfig> listDiscloudConfigFiles`
await for (final DiscloudConfig config in listDiscloudConfigByAppId(directory, appId)) {
  // ...
}
```
