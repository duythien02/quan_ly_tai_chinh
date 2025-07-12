// lib/src/data/models/auth/auth_token_model.dart
// Package imports:
import 'package:hive_flutter/hive_flutter.dart';

import '../../data/models/model_type_id.dart';

part 'login.g.dart'; // Sẽ được generate bởi build_runner (hive_generator)

@HiveType(typeId: ModelTypeId.authToken) // Sử dụng TypeId đã định nghĩa
class Login {
  Login({
    this.accessToken,
    // this.refreshToken,
  });
  @HiveField(0)
  final String? accessToken;

  // @HiveField(1)
  // final String? refreshToken;

  Login copyWith({
    final String? accessToken,
    // final String? refreshToken,
  }) {
    return Login(
      accessToken: accessToken ?? this.accessToken,
      // refreshToken: refreshToken ?? this.refreshToken,
    );
  }
}
