// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:discloud_config/converters/bool.dart';
import 'package:discloud_config/converters/int.dart';
import 'package:discloud_config/converters/list.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable(includeIfNull: false)
class DiscloudConfigData {
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

  factory DiscloudConfigData.fromJson(Map<String, dynamic> json) =>
      _$DiscloudConfigDataFromJson(json);

  @TextToListConverter()
  final List<String>? APT;
  @TextToBoolConverter()
  final bool? AUTORESTART;
  final String? AVATAR;
  final String? HOSTNAME;
  final String? ID;
  final String? MAIN;
  final String? NAME;
  @TextToIntConverter()
  final int? RAM;
  final String? START;
  final String? STORAGE;
  final String? TYPE;
  final String? VERSION;
  @TextToBoolConverter()
  final bool? VLAN;

  Map<String, dynamic> toJson() => _$DiscloudConfigDataToJson(this);
}
