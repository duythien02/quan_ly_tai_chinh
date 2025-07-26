// Package imports:
import 'package:hive_flutter/hive_flutter.dart';

import '../../data/models/model_type_id.dart';

part 'auth.g.dart';

@HiveType(typeId: ModelTypeId.auth)
class Auth {
  Auth({
    this.accessToken,
    this.refreshToken,
    this.hasAccounts,
  });
  @HiveField(0)
  final String? accessToken;

  @HiveField(1)
  final String? refreshToken;

  @HiveField(2)
  final bool? hasAccounts;

  Auth copyWith({
    final String? accessToken,
    final String? refreshToken,
    final bool? hasAccounts,
  }) {
    return Auth(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      hasAccounts: hasAccounts ?? this.hasAccounts,
    );
  }
}
