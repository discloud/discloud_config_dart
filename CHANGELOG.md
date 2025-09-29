# CHANGELOG

## 1.0.9

- **fix**: Correct filter in `listDiscloudConfigFiles`

## 1.0.8

- **feat**: add more apts to DiscloudApt enum

## 1.0.7

- **Smarter Parsing:** We've made improvements to how the configuration files are read and parsed, making it more efficient and flexible.
- **Optimized Comment Handling:** The way we manage inline comments has been optimized for better performance.
- **Enhanced Documentation:** The documentation for various parts of the library has been significantly improved for better clarity and detail.

## 1.0.6

- **Improved Reliability:** We've enhanced how the configuration file paths are handled, making it more reliable across different operating systems.
- **New Refresh Feature:** You can now reload your `discloud.config` file on the fly using the new `refresh()` method, ensuring your application always has the latest settings.
- **Better Performance:** The file watching process is now more efficient.

## 1.0.5

- **New Utility:** Added a new utility file for searching files.

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
