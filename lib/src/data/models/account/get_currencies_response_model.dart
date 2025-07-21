import 'package:json_annotation/json_annotation.dart';

import '../general_response_model.dart';
import '../models.dart';
part 'get_currencies_response_model.g.dart';

@JsonSerializable(createToJson: false)
class GetCurrenciesResponseModel extends GeneralResponseModel {
  GetCurrenciesResponseModel({
    required this.data,
  });

  factory GetCurrenciesResponseModel.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _$GetCurrenciesResponseModelFromJson(json);

  @JsonKey(name: 'data')
  final CurrencyModel data;
}
