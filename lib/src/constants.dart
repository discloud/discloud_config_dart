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

  /// Database client utilities.
  mysql,

  /// The OpenSSL toolkit.
  openssl,

  /// The Puppeteer browser automation library.
  puppeteer,

  /// Browser automation framework.
  selenium,

  /// Tesseract OCR is an open-source optical character recognition engine used
  /// for extracting text from images. It supports multiple languages and can be
  /// trained for custom recognition.
  tesseract,

  /// A collection of essential build tools.
  tools,

  /// Database connectivity standard.
  unixodbc,
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
