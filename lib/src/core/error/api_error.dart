// Package imports:
import 'package:equatable/equatable.dart';

class ApiError extends Equatable {
  const ApiError({
    this.status,
    this.code,
    this.message,
  });

  final int? status;
  final String? code;
  final String? message;

  @override
  List<Object?> get props => [status, code, message];

  @override
  bool? get stringify => true;
}
