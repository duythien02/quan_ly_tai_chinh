// lib/src/data/models/auth/auth_token_model.dart
// Package imports:
import 'package:hive_flutter/hive_flutter.dart';

import '../../data/models/model_type_id.dart';

part 'register.g.dart';

@HiveType(typeId: ModelTypeId.authToken) // Sử dụng TypeId đã định nghĩa
class Register {
  Register({
    this.token,
    // this.refreshToken,
  });
  @HiveField(0)
  final String? token;

  // @HiveField(1)
  // final String? refreshToken;

  Register copyWith({
    final String? token,
    // final String? refreshToken,
  }) {
    return Register(
      token: token ?? this.token,
      // refreshToken: refreshToken ?? this.refreshToken,
    );
  }
}
