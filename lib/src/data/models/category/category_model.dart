import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable(createToJson: false)
class CategoryModel {
  const CategoryModel({
    required this.items,
  });

  factory CategoryModel.fromJson(final Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  @JsonKey(name: 'items')
  final List<CategoryDocsModel?> items;
}

@JsonSerializable()
class CategoryDocsModel {
  const CategoryDocsModel({
    this.id,
    this.name,
    this.type,
    this.iconUrl,
    this.description,
  });

  factory CategoryDocsModel.fromJson(final Map<String, dynamic> json) =>
      _$CategoryDocsModelFromJson(json);

  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'type')
  final String? type;

  @JsonKey(name: 'icon_url')
  final String? iconUrl;

  @JsonKey(name: 'description')
  final String? description;

  Map<String, dynamic> toJson() => _$CategoryDocsModelToJson(this);
}
