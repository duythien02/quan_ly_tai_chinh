// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$DeviceInfoModelToJson(DeviceInfoModel instance) {
  final val = <String, dynamic>{
    'platform': instance.platform,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('osVersion', instance.osVersion);
  val['appVersion'] = instance.appVersion;
  writeNotNull('deviceId', instance.deviceId);
  return val;
}
