// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'device_info.g.dart';

@JsonSerializable(createFactory: false)
class DeviceInfoModel {
  const DeviceInfoModel(
    this.platform,
    this.osVersion,
    this.appVersion,
    this.deviceId,
  );
  final String platform;
  @JsonKey(name: 'osVersion')
  final String? osVersion;
  @JsonKey(name: 'appVersion')
  final String appVersion;
  @JsonKey(name: 'deviceId')
  final String? deviceId;

  Map<String, dynamic> toJson() => _$DeviceInfoModelToJson(this);
}
