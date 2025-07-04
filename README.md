# Discloud Config

A configuration file handler to use with Discloud host

## Useful links

- [Discloud](https://discloud.com/)
- [Discloud Docs](https://docs.discloud.com/en)
- [Discloud Config Docs](https://docs.discloudbot.com/discloud.config)

[![Discord](https://discord.com/api/guilds/584490943034425391/widget.png?style=banner2)](https://discord.gg/discloud)

## Usage

### Import

```dart
import 'package:discloud_config/discloud_config.dart
```

### List all configuration files recursively

```dart
await for (File file in listDiscloudConfigFiles(directory)) {
  // ...
}
```

### Recursively list configuration structures by ID

```dart
await for (DiscloudConfig config in listDiscloudConfigByAppId(directory, appId)) {
  // ...
}
```
