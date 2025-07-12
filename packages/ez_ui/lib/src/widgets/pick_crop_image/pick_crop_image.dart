/*
install plugin in pubspec.yaml
- image_picker => to pick image from storage or camera (https://pub.dev/packages/image_picker)
  add this to ios Info.plist
  <key>NSPhotoLibraryUsageDescription</key>
  <string>I need this permission to test upload photo</string>
  <key>NSCameraUsageDescription</key>
  <string>I need this permission to test upload photo</string>
  <key>NSMicrophoneUsageDescription</key>
  <string>I need this permission to test upload photo</string>

  When using package image_picker: ^0.8.0+4, we should add this permission at 
  AndroidManifest
  android/app/src/debug/AndroidManifest.xml | android/app/src/main/AndroidManifest.xml | android/app/src/profile/AndroidManifest.xml
  <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>

- image_cropper => to crop the image after get from storage or camera (https://pub.dev/packages/image_cropper)
  add this to android manifest :
  <activity
    android:name="com.yalantis.ucrop.UCropActivity"
    android:screenOrientation="portrait"
    android:theme="@style/Theme.AppCompat.Light.NoActionBar"/>

- permission_handler => to handle permission such as storage, camera (https://pub.dev/packages/permission_handler)

we add some logic function so if the user press back or done with this pages, 
cache images will be deleted and not makes the storage full

Don't forget to add all images and sound used in this pages at the pubspec.yaml

*** IMPORTANT NOTES FOR IOS ***
Image Picker will crash if you pick image for a second times, this error only 
exist on iOS Simulator 14 globaly around the world but not error on the real 
device
If you want to use iOS Simulator, you need to downgrade and using iOS 
Simulator 13
Follow this step to downgrade :
1. Xcode > Preferences
2. Select the "Components" tab.
3. Download and select Simulator 13 after the download is finish
4. Press "Check and Install Now".
5. After that, use Simulator 13 instead of simulator 14
 */

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:universal_io/io.dart' as io;

class PickCropImage extends StatefulWidget {
  const PickCropImage({
    final Key? key,
    this.size,
    this.galleryButton,
    this.cameraButton,
    this.onSelected,
    this.getImageWidget,
  }) : super(key: key);
  final Widget? galleryButton;
  final Widget? cameraButton;
  final double? size;
  final void Function(File?)? onSelected;
  final Widget? getImageWidget;
  @override
  PickCropImageState createState() => PickCropImageState();
}

class PickCropImageState extends State<PickCropImage> {
  final Color _color1 = const Color(0xFF0181cc);
  final Color _color2 = const Color(0xFF515151);
  final Color _color3 = const Color(0xff777777);

  File? _image;
  final _picker = ImagePicker();

  File? _selectedFile;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    if (_selectedFile != null && _selectedFile!.existsSync()) {
      _selectedFile!.deleteSync();
    }
    _selectedFile = null;
    super.dispose();
  }

  Future<PermissionStatus> requestPermission(
    final Permission permission,
  ) async {
    final result = await permission.request();

    return result;
  }

  void _askPermissionCamera() {
    unawaited(
      requestPermission(Permission.camera).then(_onStatusRequestedCamera),
    );
  }

  void _askPermissionStorage() {
    unawaited(requestPermission(Permission.storage).then(_onStatusRequested));
  }

  void _askPermissionPhotos() {
    unawaited(requestPermission(Permission.photos).then(_onStatusRequested));
  }

  void _onStatusRequested(final PermissionStatus status) {
    if (status != PermissionStatus.granted) {
      if (io.Platform.isIOS) {
        unawaited(openAppSettings());
      } else {
        if (status == PermissionStatus.permanentlyDenied) {
          unawaited(openAppSettings());
        }
      }
    } else {
      unawaited(_getImage(ImageSource.gallery));
    }
  }

  void _onStatusRequestedCamera(final PermissionStatus status) {
    if (status != PermissionStatus.granted) {
      if (io.Platform.isIOS) {
        unawaited(openAppSettings());
      } else {
        if (status == PermissionStatus.permanentlyDenied) {
          unawaited(openAppSettings());
        }
      }
    } else {
      unawaited(_getImage(ImageSource.camera));
    }
  }

  Future<void> _getImage(final ImageSource source) async {
    final pickedFile = await _picker.pickImage(
      source: source,
      maxHeight: 1024,
      maxWidth: 1024,
    );
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });

    if (_image != null) {
      final cropped = await ImageCropper().cropImage(
        sourcePath: _image!.path,
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
        compressQuality: 100,
        maxWidth: 700,
        maxHeight: 700,
        uiSettings: [
          AndroidUiSettings(
            initAspectRatio: CropAspectRatioPreset.original,
            toolbarColor: Colors.white,
            toolbarTitle: 'Edit Images',
            statusBarColor: _color1,
            activeControlsWidgetColor: _color2,
            cropFrameColor: Colors.white,
            cropGridColor: Colors.white,
            toolbarWidgetColor: _color2,
            backgroundColor: Colors.white,
          ),
        ],
      );

      setState(() {
        if (cropped != null) {
          if (_selectedFile != null && _selectedFile!.existsSync()) {
            _selectedFile!.deleteSync();
          }
          _selectedFile = File(cropped.path);
        }

        // delete image camera
        if (source.toString() == 'ImageSource.camera' && _image!.existsSync()) {
          _image!.deleteSync();
        }

        _image = null;
      });
    }
    widget.onSelected?.call(_selectedFile);
  }

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: <Widget>[
        _getImageWidget(),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: _askPermissionCamera,
              child: widget.cameraButton ??
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.camera_alt,
                        color: _color3,
                        size: 40,
                      ),
                      const SizedBox(width: 10),
                      const Text('Camera'),
                    ],
                  ),
            ),
            Container(
              width: 20,
            ),
            GestureDetector(
              child: widget.galleryButton ??
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.photo,
                        color: _color3,
                        size: 40,
                      ),
                      const SizedBox(width: 10),
                      const Text('Gallery'),
                    ],
                  ),
              onTap: () {
                if (io.Platform.isIOS) {
                  _askPermissionPhotos();
                } else {
                  _askPermissionStorage();
                }
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _getImageWidget() {
    return _selectedFile != null
        ? ClipOval(
            child: Image.file(
              _selectedFile!,
              width: widget.size ?? 100.r,
              height: widget.size ?? 100.r,
              fit: BoxFit.fill,
            ),
          )
        : widget.getImageWidget ??
            Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black38)),
              width: widget.size ?? 100.r,
              height: widget.size ?? 100.r,
              child: const Icon(
                Icons.add,
                color: Colors.black38,
              ),
            );
  }
}
