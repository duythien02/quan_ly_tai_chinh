// Package imports:
import 'package:flutter_downloader/flutter_downloader.dart';

class TaskInfo {
  TaskInfo({
    this.name,
    this.link,
    this.taskId,
    this.status = DownloadTaskStatus.undefined,
    this.progress = 0,
  });
  final String? name;
  String? link;

  String? taskId;
  int? progress;
  DownloadTaskStatus? status;
}
