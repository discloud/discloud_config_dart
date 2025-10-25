// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DiscloudConfigData _$DiscloudConfigDataFromJson(Map<String, dynamic> json) =>
    _DiscloudConfigData(
      APT: const TextToListConverter().fromJson(json['APT']),
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

Map<String, dynamic> _$DiscloudConfigDataToJson(_DiscloudConfigData instance) =>
    <String, dynamic>{
      'APT': const TextToListConverter().toJson(instance.APT),
      'AUTORESTART': const TextToBoolConverter().toJson(instance.AUTORESTART),
      'AVATAR': instance.AVATAR,
      'HOSTNAME': instance.HOSTNAME,
      'ID': instance.ID,
      'MAIN': instance.MAIN,
      'NAME': instance.NAME,
      'RAM': const TextToIntConverter().toJson(instance.RAM),
      'START': instance.START,
      'STORAGE': instance.STORAGE,
      'TYPE': instance.TYPE,
      'VERSION': instance.VERSION,
      'VLAN': const TextToBoolConverter().toJson(instance.VLAN),
    };
