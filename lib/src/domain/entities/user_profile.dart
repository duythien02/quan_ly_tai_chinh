import 'package:hive_flutter/hive_flutter.dart';

import '../../data/models/model_type_id.dart';

part 'user_profile.g.dart';

@HiveType(typeId: ModelTypeId.userProfile)
class UserProfile {
  UserProfile({
    this.id,
    this.username,
    this.email,
    this.avatar,
    this.createdAt,
    this.updatedAt,
  });

  @HiveField(0)
  final String? id;

  @HiveField(1)
  final String? username;

  @HiveField(2)
  final String? email;

  @HiveField(3)
  final String? avatar;

  @HiveField(4)
  final String? createdAt;

  @HiveField(5)
  final String? updatedAt;
}
