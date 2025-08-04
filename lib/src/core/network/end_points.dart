// Package imports:
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EndPoints {
  EndPoints._();
  //auth
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String refreshToken = '/auth/refresh-token';

  //account
  static const String getAccounts = '/account';
  static const String createAccount = '/account/create';
  static const String getCurrencies = '/account/currencies';

  //user profile
  static const String getMe = '/user/me';

  //transaction
  static const String getTransactionSummary = '/transaction/summary';
  static const String createTransaction = '/transaction/create';

  //category
  static const String getCategories = '/category';
  static const String createCategory = '/category/create';
}

String getDotEnv(final String key) {
  return dotenv.get(key);
}
