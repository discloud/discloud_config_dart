// ignore_for_file: constant_identifier_names, public_member_api_docs

/// Defines the available scopes for Discloud configuration.
enum DiscloudScope {
  /// The packages to be installed.
  APT,

  /// Whether the application should automatically restart.
  AUTORESTART,

  /// The URL of the application's avatar.
  AVATAR,

  /// The hostname of the application.
  HOSTNAME,

  /// The ID of the application.
  ID,

  /// The main file of the application.
  MAIN,

  /// The name of the application.
  NAME,

  /// The amount of RAM allocated to the application.
  RAM,

  /// The command to start the application.
  START,

  /// The type of the application (e.g., 'bot', 'site').
  TYPE,

  /// The version of the application.
  VERSION,

  /// The storage path for the application.
  STORAGE,

  /// Whether the application is on a VLAN.
  VLAN,
}
