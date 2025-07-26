import 'package:json_annotation/json_annotation.dart';

import '../general_response_model.dart';
import 'auth_model.dart';

part 'auth_response_model.g.dart';

@JsonSerializable(createToJson: false)
class AuthResponseModel extends GeneralResponseModel {
  AuthResponseModel({
    required this.data,
  });

  factory AuthResponseModel.fromJson(final Map<String, dynamic> json) =>
      _$AuthResponseModelFromJson(json);

  @JsonKey(name: 'data')
  final AuthModel data;
}
