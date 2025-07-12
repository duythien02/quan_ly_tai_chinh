import 'package:json_annotation/json_annotation.dart';

import '../../general_response_model.dart';
import '../register_model.dart';

part 'register_response_model.g.dart';

@JsonSerializable(createToJson: false)
class RegisterResponseModel extends GeneralResponseModel {
  RegisterResponseModel({
    required this.data,
  });

  factory RegisterResponseModel.fromJson(final Map<String, dynamic> json) =>
      _$RegisterResponseModelFromJson(json);
  @JsonKey(name: 'data')
  final RegisterModel data;
}
