// Package imports:
import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

// Project imports:
import '../../../../../config.dart';
import '../interceptors/header_interceptor.dart';
import '../interceptors/mockup_interceptor.dart';

class ApiProvider {
  ApiProvider({
    required this.enableLogger,
    required this.baseUrl,
    required this.getHeaders,
  }) {
    final BaseOptions dioOptions = BaseOptions()
      ..baseUrl = baseUrl
      ..connectTimeout = Config.connectTimeout
      ..receiveTimeout = Config.receiveTimeout
      ..contentType = Headers.jsonContentType
      ..headers = <String, String>{};

    apiDio = Dio(dioOptions);

    //----------------- SET HEADER ------------------//
    apiDio.interceptors.add(HeaderInterceptor(getHeaders));

    //----------------- LOGGING -------------------//
    if (enableLogger) {
      final talker = TalkerFlutter.init();
      apiDio.interceptors.add(
        TalkerDioLogger(
          talker: talker,
          settings: const TalkerDioLoggerSettings(
            printRequestHeaders: true,
          ),
        ),
      );
    }

    //---------------- MOCKUP -------------------//
    if (enableLogger) {
      apiDio.interceptors.add(MockUpInterceptor());
    }
  }
  late Dio apiDio;
  bool enableLogger;
  String baseUrl;
  Future<Map<String, dynamic>> Function() getHeaders;
}
