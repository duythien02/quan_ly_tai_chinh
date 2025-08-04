import '../../../config.dart';

class UrlHelper {
  /// Ghép baseUrl với một đường dẫn tương đối để tạo thành URL đầy đủ.
  static String resolve(final String? relativePath) {
    // Trả về chuỗi rỗng nếu path null hoặc rỗng, tránh gây lỗi
    if (relativePath == null || relativePath.isEmpty) {
      // Bạn có thể trả về URL của một ảnh placeholder ở đây nếu muốn
      return '';
    }

    // Xử lý trường hợp baseUrl hoặc relativePath có/không có dấu '/'
    final baseUrl = Config.baseUrl;

    // Nếu relativePath đã là một URL đầy đủ thì trả về luôn
    if (relativePath.startsWith('http')) {
      return relativePath;
    }

    // Ghép URL một cách an toàn
    return Uri.parse(baseUrl).resolve(relativePath).toString();
  }
}
