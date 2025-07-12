// Dart imports:
// ignore_for_file: use_build_context_synchronously

// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:ez_intl/ez_intl.dart';
import 'package:ez_resources/ez_resources.dart';
import 'package:ez_ui/ez_ui.dart';
import 'package:file_picker/file_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:path/path.dart';

// Project imports:
import '../enums/file_extension_type.dart';
import 'alert.dart';
import 'app_permission_helper.dart';
import 'string_helper.dart';
import 'utils.dart';

class FileTypeBundle {
  FileTypeBundle({
    required this.fileType,
    required this.text,
    required this.avatar,
  });

  final FileType fileType;
  final String text;
  final Widget avatar;
}

Future<List<PickedFileBundle>?> showFilePicker(final BuildContext context) {
  return showCupertinoModalBottomSheet<List<PickedFileBundle>>(
    context: context,
    backgroundColor: AppColors.transparent,
    builder: (final _) {
      return Material(
        child: SafeArea(
          child: Padding(
            padding: AppPadding.mediumAll(),
            child: Container(
              height: 80,
              color: AppColors.transparent,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (final _, final index) {
                  return _buildBundles(
                    context,
                    bundle: fileTypeBundles(context)[index],
                  );
                },
                separatorBuilder: (final context, final index) =>
                    const SizedBox(width: 30),
                itemCount: fileTypeBundles(context).length,
              ),
            ),
          ),
        ),
      );
    },
  );
}

Widget _buildBundles(
  final BuildContext context, {
  required final FileTypeBundle bundle,
}) {
  return InkWell(
    borderRadius: BorderRadius.circular(5),
    onTap: () async {
      await _onBundleTap(context, bundle).then(
        (final pickedFileBundle) => //
            Navigator.pop(context, pickedFileBundle),
      );
    },
    child: Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.surface,
              ),
              child: bundle.avatar,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            bundle.text,
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyLarge?.color,
            ),
          ),
        ],
      ),
    ),
  );
}

Future<List<PickedFileBundle>?> _onBundleTap(
  final BuildContext context,
  final FileTypeBundle bundle,
) async {
  FilePickerResult? result;

  final hasPermission = await _checkFilePermission(context);

  result = hasPermission
      ? await FilePicker.platform
          .pickFiles(allowMultiple: true, type: bundle.fileType)
      : null;

  if (result != null) {
    final files = result.paths.map((final path) => File(path ?? '')).toList();
    final pickedFileBundle = files.map(
      (final file) {
        final fileExtension = getFileExtension(file.path);

        return PickedFileBundle(
          name: file.path.split('/').last,
          file: file,
          fileExtension: fileExtension,
          bundleWidget: buildBundleExtensionWidget(file.path, fileExtension),
        );
      },
    ).toList();

    return pickedFileBundle;
  } else {
    if (!hasPermission) {
      Alert.showSettingPhotoLibrary(context);
    }

    return null;
  }
}

Future<List<PickedFileBundle>?> attachImage(final BuildContext context) async {
  return _onBundleTap(context, fileTypeBundles(context).first);
}

List<FileTypeBundle> fileTypeBundles(final BuildContext context) => [
      FileTypeBundle(
        avatar: Icon(Icons.image, size: 30, color: Theme.of(context).hintColor),
        fileType: FileType.media,
        text: context.l10n.image,
      ),
      FileTypeBundle(
        avatar: Icon(
          Icons.file_upload,
          size: 30,
          color: Theme.of(context).hintColor,
        ),
        fileType: FileType.any,
        text: context.l10n.file,
      ),
    ];

FileExtensionType getFileExtension(final String path) {
  final docType = ['.doc', '.dot', '.docx', '.dotx'];
  final imgType = ['.jpeg', '.png', '.jpg'];
  final excelType = ['.xlsx', '.xlsm', '.xlsb', '.xltx'];
  final pdfType = ['.pdf'];
  final videoType = ['.mp4', '.avi', '.wmv', '.flv', '.hevc', '.mov'];
  final audioType = ['.mp3', '.aac', '.ogg'];

  final ext = extension(path);

  if (docType.contains(ext)) {
    return FileExtensionType.doc;
  }
  if (imgType.contains(ext)) {
    return FileExtensionType.image;
  }
  if (excelType.contains(ext)) {
    return FileExtensionType.excel;
  }
  if (pdfType.contains(ext)) {
    return FileExtensionType.pdf;
  }
  if (videoType.contains(ext)) {
    return FileExtensionType.video;
  }
  if (audioType.contains(ext)) {
    return FileExtensionType.audio;
  }

  return FileExtensionType.other;
}

Widget buildBundleExtensionWidget(
  final String source,
  final FileExtensionType fileExtension,
) {
  switch (fileExtension) {
    case FileExtensionType.image:
      return source.isURL()
          ? EzCachedNetworkImage(imageUrl: source)
          : Image.file(File(source), fit: BoxFit.cover);
    case FileExtensionType.doc:
      return EZResources.image(
        ImageParams(name: AppIcons.icDocExtension),
      );
    case FileExtensionType.pdf:
      return EZResources.image(ImageParams(name: AppIcons.icPdfExtension));
    case FileExtensionType.excel:
      return EZResources.image(
        ImageParams(name: AppIcons.icExcelExtension),
      );
    case FileExtensionType.audio:
    case FileExtensionType.video:
    case FileExtensionType.other:
      return EZResources.image(
        ImageParams(
          name: AppIcons.icOtherExtension,
        ),
      );
  }
}

Future<bool> _checkFilePermission(final BuildContext context) async {
  if (Utils.isAndroid) {
    return AppPermissionHelper.requestStoragePermission(context);
  }

  return true;
}

class PickedFileBundle {
  PickedFileBundle({
    required this.name,
    required this.file,
    required this.bundleWidget,
    required this.fileExtension,
  });

  final String name;
  final File file;
  final Widget bundleWidget;
  final FileExtensionType fileExtension;
}
