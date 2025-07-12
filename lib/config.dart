// GENERATED CODE - DO NOT MODIFY BY HAND

// Dart imports:
import 'dart:io';

// Package imports:
import 'package:flutter_dotenv/flutter_dotenv.dart';

enum Environment { dev, staging, prod }

class Config {
  static String get appName => dotenv.env['APP_NAME']!;
  static String get baseUrl => dotenv.env['BASE_URL']!;
  static String get enableDebug => dotenv.env['ENABLE_DEBUG']!;
  static String get env => dotenv.env['ENV']!;

  static bool get isDebug => enableDebug == 'true';

  static Future<void> init({required final Environment environment}) async {
    switch (environment) {
      case Environment.dev:
        {
          await dotenv.load(
            fileName: '.env/.env.dev',
          );
          break;
        }
      case Environment.prod:
        {
          await dotenv.load(
            fileName: '.env/.env.prod',
          );
          break;
        }
      case Environment.staging:
        {
          await dotenv.load(
            fileName: '.env/.env.staging',
          );
          break;
        }
    }
  }

  static void initTest() {
    dotenv.testLoad(
      fileInput: File('.env/.env.dev').readAsStringSync(),
    );
  }

//------------CONFIGS AFTER THIS LINE CAN BE MODIFIED MANUALLY------------------
  static const Duration connectTimeout = Duration(milliseconds: 40000);
  static const Duration receiveTimeout = Duration(milliseconds: 100000);
  static const String apiKey = '';
  static const String staticProduct = 'MA_IOS';
}
