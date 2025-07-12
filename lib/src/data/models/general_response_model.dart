// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
part 'general_response_model.g.dart';

@JsonSerializable(createToJson: false)
class GeneralResponseModel {
  GeneralResponseModel({this.status, this.code, this.message});

  factory GeneralResponseModel.fromJson(final Map<String, dynamic> json) =>
      _$GeneralResponseModelFromJson(json);

  @JsonKey(name: 'status')
  int? status;
  @JsonKey(name: 'code')
  String? code;
  @JsonKey(name: 'message')
  String? message;
}
