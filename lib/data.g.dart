// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiscloudConfigData _$DiscloudConfigDataFromJson(Map<String, dynamic> json) =>
    DiscloudConfigData(
      APT: const TextToUnmodifiableListConverter().fromJson(json['APT']),
      AUTORESTART: const TextToBoolConverter().fromJson(json['AUTORESTART']),
      AVATAR: json['AVATAR'] as String?,
      HOSTNAME: json['HOSTNAME'] as String?,
      ID: json['ID'] as String?,
      MAIN: json['MAIN'] as String?,
      NAME: json['NAME'] as String?,
      RAM: const TextToIntConverter().fromJson(json['RAM']),
      START: json['START'] as String?,
      STORAGE: json['STORAGE'] as String?,
      TYPE: json['TYPE'] as String?,
      VERSION: json['VERSION'] as String?,
      VLAN: const TextToBoolConverter().fromJson(json['VLAN']),
    );

Map<String, dynamic> _$DiscloudConfigDataToJson(DiscloudConfigData instance) =>
    <String, dynamic>{
      if (const TextToUnmodifiableListConverter().toJson(instance.APT)
          case final value?)
        'APT': value,
      if (const TextToBoolConverter().toJson(instance.AUTORESTART)
          case final value?)
        'AUTORESTART': value,
      if (instance.AVATAR case final value?) 'AVATAR': value,
      if (instance.HOSTNAME case final value?) 'HOSTNAME': value,
      if (instance.ID case final value?) 'ID': value,
      if (instance.MAIN case final value?) 'MAIN': value,
      if (instance.NAME case final value?) 'NAME': value,
      if (const TextToIntConverter().toJson(instance.RAM) case final value?)
        'RAM': value,
      if (instance.START case final value?) 'START': value,
      if (instance.STORAGE case final value?) 'STORAGE': value,
      if (instance.TYPE case final value?) 'TYPE': value,
      if (instance.VERSION case final value?) 'VERSION': value,
      if (const TextToBoolConverter().toJson(instance.VLAN) case final value?)
        'VLAN': value,
    };
