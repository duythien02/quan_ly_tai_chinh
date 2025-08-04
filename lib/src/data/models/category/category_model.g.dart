// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      items: (json['items'] is List)
          ? (json['items'] as List<dynamic>)
              .map((e) => e == null || e is! Map
                  ? null
                  : CategoryDocsModel.fromJson(e as Map<String, dynamic>))
              .toList()
          : [],
    );

CategoryDocsModel _$CategoryDocsModelFromJson(Map<String, dynamic> json) =>
    CategoryDocsModel(
      id: json['id']?.toString(),
      name: json['name']?.toString(),
      type: json['type']?.toString(),
      iconUrl: json['icon_url']?.toString(),
      description: json['description']?.toString(),
    );

Map<String, dynamic> _$CategoryDocsModelToJson(CategoryDocsModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('type', instance.type);
  writeNotNull('icon_url', instance.iconUrl);
  writeNotNull('description', instance.description);
  return val;
}
