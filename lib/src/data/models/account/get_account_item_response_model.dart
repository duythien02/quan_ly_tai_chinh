import 'package:json_annotation/json_annotation.dart';

import '../general_response_model.dart';
import '../models.dart';

part 'get_account_item_response_model.g.dart';

@JsonSerializable(createToJson: false)
class GetAccountItemResponseModel extends GeneralResponseModel {
  GetAccountItemResponseModel({
    required this.data,
  });

  factory GetAccountItemResponseModel.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _$GetAccountItemResponseModelFromJson(json);

  @JsonKey(name: 'data')
  final AccountDocsModel data;
}
