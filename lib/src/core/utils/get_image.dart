// Dart imports:
// ignore_for_file: use_build_context_synchronously
// ignore_for_file: long-parameter-list

// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:collection/collection.dart';
import 'package:ez_intl/ez_intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:ez_ui/ez_ui.dart';

// Project imports:
import '../app_strings.dart';
import 'app_permission_helper.dart';

export 'package:image_picker/image_picker.dart';

void getImagePath(final BuildContext context, final GetImageParams params) {
  unawaited(
    showCupertinoModalPopup<dynamic>(
      context: context,
      builder: (final context) => CupertinoActionSheet(
        actions: <Widget>[
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context, 'Camera');
              _requestCameraPermission(
                context,
                result: params.result,
                cameraPermissionDeniedHandler:
                    params.cameraPermissionDeniedHandler,
              );
            },
            child: Text(context.l10n.takePicture),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context, 'Photo');

              _requestSelectPermissions(
                context,
                result: params.result,
                libraryPermissionDeniedHandler:
                    params.libraryPermissionDeniedHandler,
              );
            },
            child: Text(context.l10n.photoLibrary),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          isDefaultAction: true,
          onPressed: () {
            Navigator.pop(context, 'Cancel');
          },
          child: Text(context.l10n.cancel),
        ),
      ),
    ),
  );
}

Future<void> _requestCameraPermission(
  final BuildContext context, {
  required final void Function(String? imagePath) result,
  required final void Function() cameraPermissionDeniedHandler,
}) async {
  final hasPermission =
      await AppPermissionHelper.requestCameraPermission(context);

  if (hasPermission) {
    final image = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxHeight: 1024,
      maxWidth: 1024,
    );
    result(image?.path);
  } else {
    cameraPermissionDeniedHandler();
  }
}

Future<void> _requestSelectPermissions(
  final BuildContext context, {
  required final void Function(String? imagePath) result,
  required final void Function() libraryPermissionDeniedHandler,
}) async {
  final hasPermission =
      await AppPermissionHelper.requestPhotosPermission(context);

  if (hasPermission) {
    final image = await _selectImage();
    var path = image?.path;
    if (kIsWeb) {
      // web doesn't have extension in path -> manually add the extension
      final imageExt = image?.mimeType?.split(AppStrings.splash).lastOrNull;
      path = '$path.$imageExt';
    }
    result(path);
  } else {
    libraryPermissionDeniedHandler();
  }
}

Future<XFile?> _selectImage() async {
  return ImagePicker().pickImage(
    source: ImageSource.gallery,
    maxHeight: 1024,
    maxWidth: 1024,
  );
}

Future<String?> getImageFromSource(
  final BuildContext context, {
  required final ImageSource imageSource,
  required final Function() libraryPermissionDeniedHandler,
  required final Function() cameraPermissionDeniedHandler,
  final CameraDevice preferredCameraDevice = CameraDevice.rear,
  final bool isCrop = true,
}) async {
  final bool hasPermission;

  hasPermission = kIsWeb || (imageSource == ImageSource.gallery)
      ? await AppPermissionHelper.requestPhotosPermission(context)
      : await AppPermissionHelper.requestCameraPermission(context);

  if (hasPermission) {
    final image = await ImagePicker().pickImage(
      source: imageSource,
      preferredCameraDevice: preferredCameraDevice,
      maxHeight: 1024,
      maxWidth: 1024,
    );
    if (image == null) {
      return '';
    }
    if (kIsWeb) {
      return String.fromCharCodes(await image.readAsBytes()) +
          extension(image.name);
    }
    if (isCrop) {
      final croppedImage = await ImageCropper().cropImage(
        sourcePath: image.path,
        uiSettings: [
          AndroidUiSettings(
            toolbarColor: AppColors.primaryColor,
            toolbarWidgetColor: AppColors.white,
            cropStyle: CropStyle.circle,
          ),
          IOSUiSettings(
            cropStyle: CropStyle.circle,
          ),
        ],
      );

      return croppedImage?.path ?? image.path;
    } else {
      return image.path;
    }
  } else {
    if (imageSource == ImageSource.gallery) {
      libraryPermissionDeniedHandler();
    } else {
      cameraPermissionDeniedHandler();
    }

    return null;
  }
}

class GetImageParams {
  GetImageParams({
    required this.result,
    required this.cameraPermissionDeniedHandler,
    required this.libraryPermissionDeniedHandler,
  });

  final void Function(String? imagePath) result;
  final void Function() cameraPermissionDeniedHandler;
  final void Function() libraryPermissionDeniedHandler;
}
