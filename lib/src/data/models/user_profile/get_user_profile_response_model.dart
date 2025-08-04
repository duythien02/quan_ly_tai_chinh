import 'package:json_annotation/json_annotation.dart';

import '../general_response_model.dart';
import 'user_profile_model.dart';

part 'get_user_profile_response_model.g.dart';

@JsonSerializable(createToJson: false)
class GetUserProfileResponseModel extends GeneralResponseModel {
  GetUserProfileResponseModel({
    this.data,
  });
  factory GetUserProfileResponseModel.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _$GetUserProfileResponseModelFromJson(json);
  @JsonKey(name: 'data')
  final UserProfileModel? data;
}
