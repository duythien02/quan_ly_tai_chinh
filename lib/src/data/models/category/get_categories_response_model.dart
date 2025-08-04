import 'package:json_annotation/json_annotation.dart';

import '../general_response_model.dart';
import '../models.dart';

part 'get_categories_response_model.g.dart';

@JsonSerializable(createToJson: false)
class GetCategoriesResponseModel extends GeneralResponseModel {
  GetCategoriesResponseModel({
    this.data,
  });

  factory GetCategoriesResponseModel.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _$GetCategoriesResponseModelFromJson(json);

  @JsonKey(name: 'data')
  final CategoryModel? data;
}
