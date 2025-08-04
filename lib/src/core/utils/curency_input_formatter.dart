import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  CurrencyInputFormatter({this.symbol = '₫', this.locale = 'vi_VN'});
  final String symbol;
  final String locale;

  @override
  TextEditingValue formatEditUpdate(
    final TextEditingValue oldValue,
    final TextEditingValue newValue,
  ) {
    // Lấy chuỗi số từ giá trị mới, loại bỏ ký hiệu tiền tệ và dấu chấm
    final String digitsOnly = newValue.text.replaceAll(RegExp('[^0-9]'), '');

    if (digitsOnly.isEmpty) {
      return const TextEditingValue(
        selection: TextSelection.collapsed(offset: 0),
      );
    }

    // Chuyển chuỗi số thành số nguyên
    final int number = int.tryParse(digitsOnly) ?? 0;

    // Định dạng số với dấu chấm phân cách hàng nghìn
    final formatter = NumberFormat('#,##0', locale);
    final String formattedString = formatter.format(number);

    // Tạo văn bản cuối cùng với ký hiệu tiền tệ
    final String newText = '$formattedString $symbol';

    // Đặt vị trí con trỏ ngay trước ký hiệu tiền tệ
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length - 2),
    );
  }
}
