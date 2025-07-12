// Dart imports:
// ignore_for_file: use_build_context_synchronously

// Dart imports:
import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:ez_intl/ez_intl.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';

// Project imports:
import '../app_strings.dart';
import '../utils/alert.dart';
import '../utils/app_permission_helper.dart';
import 'models/task_download_info.dart';

typedef UpdateTaskDownloadFunction = void Function(
  String? id,
  DownloadTaskStatus? downloadTaskStatus,
  int? progress,
);

typedef OnStartedFunction = void Function(String? taskId, String? url);

class ServiceDownloader {
  factory ServiceDownloader() {
    return instance;
  }

  ServiceDownloader._internal();

  static final ServiceDownloader instance = ServiceDownloader._internal();

  Future<void> init({final bool? isDebug}) async {
    ServiceDownloader.isDebug = isDebug;
    await FlutterDownloader.initialize();

    FlutterDownloader.registerCallback(downloadCallback);
  }

  ReceivePort? _port;

  late String _localPath;

  static bool? isDebug;

  bool isListening = false;

  Future<String> _findLocalPath() async {
    try {
      final directory = Platform.isAndroid
          ? Directory('/storage/emulated/0/Download')
          : await getApplicationDocumentsDirectory();

      return directory.path;
    } catch (_) {
      return '';
    }
  }

  Future<List<DownloadTask>?> loadTask() async {
    return FlutterDownloader.loadTasks();
  }

  Future<bool?> open(final BuildContext context, final String taskId) async {
    final hasPermission =
        await AppPermissionHelper.requestStoragePermission(context);

    if (hasPermission) {
      return FlutterDownloader.open(taskId: taskId);
    } else {
      Alert.showAlertSetting(
        context,
        context.l10n.requestStoragePermission,
      );

      return null;
    }
  }

  Future<void> bindBackgroundIsolate(
    final void Function(TaskInfo) callback,
  ) async {
    _port?.close();
    _port = ReceivePort();
    final bool isSuccess = IsolateNameServer.registerPortWithName(
      _port!.sendPort,
      'downloader_send_port',
    );
    if (!isSuccess) {
      unbindBackgroundIsolate();
      await bindBackgroundIsolate(callback);

      return;
    }
    _port?.listen((final dynamic data) {
      final value = data as List;
      final String? id = value[0] as String?;
      final DownloadTaskStatus status = DownloadTaskStatus.fromInt(value[1]);

      final int? progress = value[2] as int?;

      callback(
        TaskInfo(
          taskId: id,
          status: status,
          progress: progress,
        ),
      );
    });
  }

  void unbindBackgroundIsolate() {
    isListening = false;
    IsolateNameServer.removePortNameMapping('downloader_send_port');
  }

  static void downloadCallback(
    final String id,
    final int status,
    final int progress,
  ) {
    final send = IsolateNameServer.lookupPortByName('downloader_send_port');
    send?.send([id, status, progress]);
  }

  Future<TaskInfo?> download(
    final BuildContext context, {
    required final TaskInfo taskInfo,
    required final OnStartedFunction onStarted,
  }) async {
    final hasPermission =
        await AppPermissionHelper.requestStoragePermission(context);

    if (hasPermission) {
      return _requestDownload(
        taskInfo,
        onStarted: onStarted,
      );
    } else {
      Alert.showAlertSetting(
        context,
        context.l10n.requestStoragePermission,
      );

      return null;
    }
  }

  Future<TaskInfo> _requestDownload(
    final TaskInfo task, {
    required final OnStartedFunction onStarted,
  }) async {
    _localPath =
        '${await _findLocalPath()}${Platform.pathSeparator}${AppStrings.title}';

    final savedDir = Directory(_localPath);
    final hasExisted = savedDir.existsSync();
    if (!hasExisted) {
      await savedDir.create();
    }

    task.taskId = await FlutterDownloader.enqueue(
      url: task.link!,
      headers: {'auth': 'test_for_sql_encoding'},
      savedDir: _localPath,
    );

    onStarted(task.taskId, task.link);

    return task;
  }

  Future<void> onTapDownload(
    final BuildContext context,
    final String? url,
    TaskInfo? taskInfo,
  ) async {
    taskInfo = await ServiceDownloader.instance.download(
      context,
      taskInfo: TaskInfo(link: url),
      onStarted: (final taskId, final url) {},
    );

    await ServiceDownloader.instance.bindBackgroundIsolate(
      (final taskInfoInProgress) =>
          callback(context, taskInfoInProgress, taskInfo),
    );
  }

  void callback(
    final BuildContext context,
    final TaskInfo taskInfoInProgress,
    final TaskInfo? taskInfo,
  ) {
    if (taskInfo?.taskId == taskInfoInProgress.taskId) {
      if (taskInfoInProgress.status == DownloadTaskStatus.complete) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.l10n.downloadComplete),
            action: SnackBarAction(
              label: context.l10n.open,
              onPressed: () {
                unawaited(
                  ServiceDownloader.instance
                      .open(context, taskInfoInProgress.taskId ?? ''),
                );
              },
            ),
          ),
        );
      }

      if (taskInfoInProgress.status == DownloadTaskStatus.failed) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.l10n.unknown),
          ),
        );
      }
    }
  }

  // ignore: unused_element
  Future<void> _cancelDownload(final TaskInfo task) async {
    await FlutterDownloader.cancel(taskId: task.taskId!);
  }

  Future<void> _pauseDownload(final TaskInfo task) async {
    await FlutterDownloader.pause(taskId: task.taskId!);
  }

  Future<void> _resumeDownload(final TaskInfo task) async {
    final newTaskId = await FlutterDownloader.resume(taskId: task.taskId!);
    task.taskId = newTaskId;
  }

  Future<void> _retryDownload(final TaskInfo task) async {
    final newTaskId = await FlutterDownloader.retry(taskId: task.taskId!);
    task.taskId = newTaskId;
  }

  Future<void> _delete(final TaskInfo task, final VoidCallback callback) async {
    await FlutterDownloader.remove(
      taskId: task.taskId!,
      shouldDeleteContent: true,
    );
    callback();
  }

  void actionClick(final TaskInfo task) {
    if (task.status == DownloadTaskStatus.undefined) {
      unawaited(
        _requestDownload(task, onStarted: (final taskId, final link) {}),
      );
    } else if (task.status == DownloadTaskStatus.running) {
      unawaited(_pauseDownload(task));
    } else if (task.status == DownloadTaskStatus.paused) {
      unawaited(_resumeDownload(task));
    } else if (task.status == DownloadTaskStatus.complete) {
      unawaited(_delete(task, () {}));
    } else if (task.status == DownloadTaskStatus.failed) {
      unawaited(_retryDownload(task));
    }
  }
}
