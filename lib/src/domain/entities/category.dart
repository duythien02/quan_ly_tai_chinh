import 'package:hive/hive.dart';

import '../../data/models/model_type_id.dart';

part 'category.g.dart';

@HiveType(typeId: ModelTypeId.category)
class Category {
  const Category({
    required this.items,
  });

  @HiveField(0)
  final List<CategoryDocs?> items;
}

@HiveType(typeId: ModelTypeId.categoryDocs)
class CategoryDocs {
  const CategoryDocs({
    this.id,
    this.name,
    this.type,
    this.iconUrl,
    this.description,
  });

  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? type;
  @HiveField(3)
  final String? iconUrl;
  @HiveField(4)
  final String? description;
}
