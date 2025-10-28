<!-- markdownlint-disable MD041 -->

[![pub package](https://img.shields.io/pub/v/discloud_config.svg)][package_config]
[![package publisher](https://img.shields.io/pub/publisher/discloud_config.svg)][package_config_publisher]

## Overview

This package provides a comprehensive set of tools for managing `discloud.config` files. It allows you to read, write, and validate your Discloud configurations with ease. The package is designed to be used in Dart applications that interact with the Discloud hosting service.

## Useful links

- [Discloud](https://discloud.com)
- [Discloud Docs](https://docs.discloud.com)
- [Discloud Config Docs](https://docs.discloud.com/en/configurations/discloud.config)

[![Discord](https://discord.com/api/guilds/584490943034425391/widget.png?style=banner2)](https://discord.discloudbot.com)

## Installation

Add it to your [`pubspec.yaml`][pubspec] as a [dependencies] by running the following command.

```sh
dart pub add discloud_config
```

## Usage

### Import

```dart
import 'package:discloud_config/discloud_config.dart';
```

### Make an instance

You can create a `DiscloudConfig` instance in several ways:

```dart
// From a File
final configFile = File('path/to/your/project/discloud.config');
final config = DiscloudConfig(configFile);

// From a directory path (asynchronously)
final configFromPath = await DiscloudConfig.fromPath('path/to/your/project');

// From a FileSystemEntity (asynchronously)
final directory = Directory('path/to/your/project');
final configFromEntity = await DiscloudConfig.fromFileSystemEntity(directory);

// From a Uri (asynchronously)
final uri = Uri.file('path/to/your/project');
final configFromUri = await DiscloudConfig.fromUri(uri);
```

All constructors accept an optional `autoSave` parameter. See the "Auto-saving" section for more details.

### Watch configuration file

- `DiscloudConfigData` is read-only, see [`Updating DiscloudConfigData`](#updating-discloudconfigdata)

```dart
// Stream<DiscloudConfigData?>
await for (final DiscloudConfigData? data in config.watch()) {
  // ...
}
```

### Auto-saving

The `autoSave` parameter in the constructors (`DiscloudConfig.fromPath`, `DiscloudConfig.fromFileSystemEntity`, etc.) controls whether changes are automatically written to the file.

- If `autoSave` is `true` (the default), any call to `set` or `setData` will immediately save the changes to the `discloud.config` file.

- If `autoSave` is `false`, you must manually call the `save` method to persist any changes you've made. This can be useful for batching multiple changes together.

**Example:**

```dart
// With autoSave enabled (default)
final config = await DiscloudConfig.fromPath('path/to/your/project'); // autoSave is true
await config.set(DiscloudScope.RAM, 1024); // Changes are saved automatically

// With autoSave disabled
final config2 = await DiscloudConfig.fromPath('path/to/your/project', autoSave: false);
await config2.set(DiscloudScope.RAM, 2048); // Changes are not saved yet
await config2.save(); // Manually save the changes
```

### Create a new DiscloudConfigData from JSON

```dart
DiscloudConfigData.fromJson(Map<String, dynamic>);
```

### Updating DiscloudConfigData

```dart
// Use copyWith
final DiscloudConfigData newData = oldData.copyWith(TYPE: DiscloudAppType.bot.name/*"bot"*/);
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

- [Filing bugs and feature requests][new_issue]
- [Send a pull request][pull_request]
- Or, create something awesome using this API and share with us and others!

For the stability of the API and existing users, consider opening an issue
first before implementing a large new feature or breaking an API. For smaller
changes (like documentation, minor bug fixes), just send a pull request.

## Testing

All pull requests are validated against CI, and must pass.

Ensure build runs

```sh
dart run build_runner build
```

Ensure code passes all our [analyzer checks][analysis_options]:

```sh
dart analyze
```

Ensure all code is formatted with the latest [dev-channel SDK][dev_sdk].

```sh
dart format .
dart fix --apply
```

Run all of our unit tests:

```sh
dart test
```

## License

This project is licensed under the Apache 2.0 License - see the [LICENSE](LICENSE) file for details.

[analysis_options]: analysis_options.yaml
[dependencies]: https://dart.dev/tools/pub/dependencies
[dev_sdk]: https://dart.dev/get-dart
[new_issue]: https://github.com/discloud/discloud_config_dart/issues/new
[package_config]: https://pub.dev/packages/discloud_config
[package_config_publisher]: https://pub.dev/packages/discloud_config/publisher
[pubspec]: https://dart.dev/tools/pub/pubspec
[pull_request]: https://github.com/discloud/discloud_config_dart/pulls
