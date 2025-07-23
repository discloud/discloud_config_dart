/// The maximum length for a Discloud application name.
const discloudNameMaxSize = 30;

/// The minimum RAM required for a Discloud application.
const discloudRamMin = 100;

/// Enumerates the available packages that can be installed on Discloud.
enum DiscloudApt {
  /// The canvas package.
  canvas,

  /// The ffmpeg package for audio and video processing.
  ffmpeg,

  /// The Java Development Kit.
  java,

  /// The libgl package for graphics.
  libgl,

  /// The OpenSSL toolkit.
  openssl,

  /// The Puppeteer browser automation library.
  puppeteer,

  /// A collection of essential build tools.
  tools,
}

/// Defines the type of application on Discloud.
enum DiscloudAppType {
  /// A bot application.
  bot,

  /// A website application.
  site,
}

/// Specifies the minimum RAM required based on the application type.
enum DiscloudRamMinByType {
  /// The minimum RAM for a bot (100 MB).
  bot(100),

  /// The minimum RAM for a site (512 MB).
  site(512);

  /// Creates a new instance of [DiscloudRamMinByType].
  const DiscloudRamMinByType(this.value);

  /// The minimum RAM value.
  final int value;
}

/// Represents the available versions for a Discloud application.
enum DiscloudVersion {
  /// The latest stable version.
  latest,

  /// The long-term support version.
  lts,

  /// The current version.
  current,

  /// A specific version identified as 'suja'.
  suja,
}
