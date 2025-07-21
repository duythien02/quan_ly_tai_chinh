// Package imports:
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EndPoints {
  EndPoints._();
  //auth
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String refreshToken = '/auth/refresh-token';

  //account
  static const String getAllAccounts = '/accounts';
  static const String createAccount = '/accounts/create';
  static const String getCurrencies = '/accounts/currencies';
}

String getDotEnv(final String key) {
  return dotenv.get(key);
}
