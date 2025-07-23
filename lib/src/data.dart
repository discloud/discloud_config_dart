// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables, public_member_api_docs

import 'package:discloud_config/src/converters/bool.dart';
import 'package:discloud_config/src/converters/int.dart';
import 'package:discloud_config/src/converters/list.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

/// Represents the data structure for Discloud configuration settings.
@JsonSerializable(includeIfNull: false)
class DiscloudConfigData {
  /// Creates a new instance of [DiscloudConfigData].
  const DiscloudConfigData({
    this.APT,
    this.AUTORESTART,
    this.AVATAR,
    this.HOSTNAME,
    this.ID,
    this.MAIN,
    this.NAME,
    this.RAM,
    this.START,
    this.STORAGE,
    this.TYPE,
    this.VERSION,
    this.VLAN,
  });

  /// Creates a [DiscloudConfigData] instance from a JSON map.
  factory DiscloudConfigData.fromJson(Map<String, dynamic> json) =>
      _$DiscloudConfigDataFromJson(json);

  /// A list of packages to be installed.
  @TextToListConverter()
  final List<String>? APT;

  /// Whether the application should automatically restart.
  @TextToBoolConverter()
  final bool? AUTORESTART;

  /// The URL of the application's avatar.
  final String? AVATAR;

  /// The hostname of the application.
  final String? HOSTNAME;

  /// The ID of the application.
  final String? ID;

  /// The main file of the application.
  final String? MAIN;

  /// The name of the application.
  final String? NAME;

  /// The amount of RAM allocated to the application.
  @TextToIntConverter()
  final int? RAM;

  /// The command to start the application.
  final String? START;

  /// The storage path for the application.
  final String? STORAGE;

  /// The type of the application (e.g., 'bot', 'site').
  final String? TYPE;

  /// The version of the application.
  final String? VERSION;

  /// Whether the application is on a VLAN.
  @TextToBoolConverter()
  final bool? VLAN;

  /// Converts this [DiscloudConfigData] instance to a JSON map.
  Map<String, dynamic> toJson() => _$DiscloudConfigDataToJson(this);
}
