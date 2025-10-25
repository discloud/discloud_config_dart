// ignore_for_file: non_constant_identifier_names

import "package:discloud_config/src/converters/bool.dart";
import "package:discloud_config/src/converters/int.dart";
import "package:discloud_config/src/converters/list.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part "data.freezed.dart";
part "data.g.dart";

/// Represents the data structure for Discloud configuration settings.
@Freezed(copyWith: true)
abstract class DiscloudConfigData with _$DiscloudConfigData {
  @JsonSerializable(includeIfNull: false)
  const factory DiscloudConfigData({
    /// A list of packages to be installed.
    @TextToListConverter() final List<String>? APT,

    /// Whether the application should automatically restart.
    @TextToBoolConverter() final bool? AUTORESTART,

    /// The URL of the application's avatar.
    final String? AVATAR,

    /// The hostname of the application.
    final String? HOSTNAME,

    /// The ID of the application.
    final String? ID,

    /// The main file of the application.
    final String? MAIN,

    /// The name of the application.
    final String? NAME,

    /// The amount of RAM allocated to the application.
    @TextToIntConverter() final int? RAM,

    /// The command to start the application.
    final String? START,

    /// The storage path for the application.
    final String? STORAGE,

    /// The type of the application (e.g., 'bot', 'site').
    final String? TYPE,

    /// The version of the application.
    final String? VERSION,

    /// Whether the application is on a VLAN.
    @TextToBoolConverter() final bool? VLAN,
  }) = _DiscloudConfigData;

  factory DiscloudConfigData.fromJson(Map<String, dynamic> json) =>
      _$DiscloudConfigDataFromJson(json);
}
