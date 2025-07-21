import 'package:json_annotation/json_annotation.dart';

import '../general_response_model.dart';
import '../models.dart';

part 'get_accounts_response_model.g.dart';

@JsonSerializable(createToJson: false)
class GetAccountsResponseModel extends GeneralResponseModel {
  GetAccountsResponseModel({
    required this.data,
  });

  factory GetAccountsResponseModel.fromJson(final Map<String, dynamic> json) =>
      _$GetAccountsResponseModelFromJson(json);

  @JsonKey(name: 'data')
  final AccountModel data;
}
