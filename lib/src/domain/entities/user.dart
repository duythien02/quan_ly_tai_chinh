// Package imports:
import 'package:hive_flutter/hive_flutter.dart';

import '../../data/models/model_type_id.dart';

part 'user.g.dart';

@HiveType(typeId: ModelTypeId.user)
class User {
  User({
    this.accessToken,
    this.refreshToken,
    this.userId,
    this.email,
    this.username,
    this.hasAccount,
  });
  @HiveField(0)
  final String? accessToken;

  @HiveField(1)
  final String? refreshToken;

  @HiveField(2)
  final String? userId;

  @HiveField(3)
  final String? email;

  @HiveField(4)
  final String? username;

  @HiveField(5)
  final bool? hasAccount;

  User copyWith({
    final String? accessToken,
    final String? refreshToken,
    final String? userId,
    final String? email,
    final String? username,
    final bool? hasAccount,
  }) {
    return User(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      userId: userId ?? this.userId,
      email: email ?? this.email,
      username: username ?? this.username,
      hasAccount: hasAccount ?? this.hasAccount,
    );
  }
}
