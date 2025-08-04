// Package imports:
import 'package:hive_flutter/hive_flutter.dart';

import '../../data/models/model_type_id.dart';

part 'auth.g.dart';

@HiveType(typeId: ModelTypeId.auth)
class Auth {
  Auth({
    this.userId,
    this.accessToken,
    this.refreshToken,
    this.hasAccounts,
  });

  @HiveField(0)
  final String? userId;

  @HiveField(1)
  final String? accessToken;

  @HiveField(2)
  final String? refreshToken;

  @HiveField(3)
  final bool? hasAccounts;

  Auth copyWith({
    final String? userId,
    final String? accessToken,
    final String? refreshToken,
    final bool? hasAccounts,
  }) {
    return Auth(
      userId: userId ?? this.userId,
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      hasAccounts: hasAccounts ?? this.hasAccounts,
    );
  }
}
