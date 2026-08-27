// ignore_for_file: non_constant_identifier_names

import "package:discloud_config/src/converters/bool.dart";
import "package:discloud_config/src/converters/int.dart";
import "package:discloud_config/src/converters/iterable.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part "data.freezed.dart";
part "data.g.dart";

/// Represents the data structure for Discloud configuration settings.
@Freezed(copyWith: true)
abstract class DiscloudConfigData with _$DiscloudConfigData {
  // ignore: invalid_annotation_target
  @JsonSerializable(includeIfNull: false)
  const factory({
    /// A list of packages to be installed.
    @TextToIterableConverter() Iterable<String>? APT,

    /// Whether the application should automatically restart.
    @TextToBoolConverter() bool? AUTORESTART,

    /// The URL of the application's avatar.
    String? AVATAR,

    /// The hostname of the application.
    String? HOSTNAME,

    /// The ID of the application.
    String? ID,

    /// The main file of the application.
    String? MAIN,

    /// The name of the application.
    String? NAME,

    /// The amount of RAM allocated to the application.
    @TextToIntConverter() int? RAM,

    /// The command to start the application.
    String? START,

    /// The storage path for the application.
    String? STORAGE,

    /// The type of the application (e.g., 'bot', 'site').
    String? TYPE,

    /// The version of the application.
    String? VERSION,

    /// Whether the application is on a VLAN.
    @TextToBoolConverter() bool? VLAN,
  }) = _DiscloudConfigData;

  factory fromJson(Map<String, dynamic> json) =>
      _$DiscloudConfigDataFromJson(json);
}
