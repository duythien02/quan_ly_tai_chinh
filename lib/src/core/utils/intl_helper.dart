// Package imports:
import 'package:ez_intl/ez_intl.dart';

// Project imports:

class IntlHelper {
  static DateFormat dateFormatter = DateFormat('dd/MM/yyyy');

  static DateFormat dateFormatter2 = DateFormat('yyyy-MM-ddTHH:mm:ssZ');

  static DateFormat dateFormatter3 = DateFormat('MM/dd/yyyy');

  static DateFormat hourFormatter = DateFormat(DateFormat.HOUR24_MINUTE);

  static String numberFormatter(final int point) {
    return NumberFormat.currency(
      locale: AppLocale.vi,
      symbol: '',
    ).format(point).replaceAll('.', ',');
  }

  static String convertUTCToddMMyyyy(
    final String dateTime, {
    final bool toLocal = true,
  }) {
    try {
      final DateTime value = dateFormatter2.parseUTC(dateTime);

      return dateFormatter.format(toLocal ? value.toLocal() : value);
    } catch (error) {
      return dateTime;
    }
  }

  /// It converts a date string from MM/dd/yyyy to dd/MM/yyyy
  ///
  /// @param dateTime The date time string to be converted.
  ///
  /// @return A string
  static String dateTimeFormat(final String dateTime) {
    try {
      final DateTime value = dateFormatter3.parse(dateTime);

      return dateFormatter.format(value);
    } catch (error) {
      return dateTime;
    }
  }
}

extension DateTimeExtensionsString on String {
  int? getTimeStamp(final DateFormat format) {
    try {
      return format.parse(this).millisecondsSinceEpoch;
    } catch (error) {
      return null;
    }
  }

  DateTime? getDateTime(final DateFormat format) {
    try {
      return format.parse(this);
    } catch (error) {
      return null;
    }
  }
}

extension DateTimeExtensions on DateTime {
  String formatByDateFormat(final DateFormat dateFormat) {
    return dateFormat.format(this);
  }

  bool isToday() {
    return year == DateTime.now().year &&
        month == DateTime.now().month &&
        day == DateTime.now().day;
  }
}
