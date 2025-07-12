// Package imports:
import 'package:logger/logger.dart';

class Log {
  const Log._();

  static Logger logger = Logger(
    printer: PrettyPrinter(printTime: true, printEmojis: false),
  );

  static void init({required final bool enable}) {
    Logger.level = enable ? Level.info : Level.nothing;
  }

  static void info(final dynamic message) {
    logger.i(message);
  }

  static void warning(final dynamic message) {
    logger.w(message);
  }

  static void error(final dynamic message) {
    logger.e(message);
  }
}
