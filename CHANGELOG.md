# CHANGELOG

## 1.0.4

- **Documentation & Structure Enhancements:** We've made the documentation clearer and improved the organization of configuration-related classes.
- **Improved Error Handling:** Better error management and a more streamlined process for listing configuration files.
- **Discord Link Fixed:** The Discord invite link in the README has been corrected.

## 1.0.3

- Avoid parsing empty config file contents at instance start
- Replace `Exception` for `ArgumentError` on `DiscloudConfig.fromPath`

## 1.0.2

- `Parser` renamed to `DiscloudConfigParser`
- Using `string` interpolation instead `List#join` on `DiscloudConfigParser#stringify` method

## 1.0.1

- fix utils exports

## 1.0.0

- Initial release
