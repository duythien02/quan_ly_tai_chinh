// Package imports:
import 'package:dio/dio.dart';
import 'package:path/path.dart';

Future<FormData?>? convertToFormDataByType(final List<String> paths) async {
  try {
    final mapFiles = <String, MultipartFile>{};
    for (var i = 0; i < paths.length; i++) {
      // api constrains with format file1 file2
      final fileName = i == 0 ? 'file1' : 'file${i + 1}';
      mapFiles[fileName] = await MultipartFile.fromFile(
        paths[i],
        filename: '$fileName${extension(paths[i])}',
      );
    }

    return FormData.fromMap(mapFiles);
  } catch (_) {
    return null;
  }
}
