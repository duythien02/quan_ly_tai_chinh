// // ignore_for_file: use_build_context_synchronously

// /*
// install plugin in pubspec.yaml
// - image_picker => to pick image from storage or camera (https://pub.dev/packages/image_picker)
//   add this to ios Info.plist
//   <key>NSPhotoLibraryUsageDescription</key>
//   <string>I need this permission to test upload photo</string>
//   <key>NSCameraUsageDescription</key>
//   <string>I need this permission to test upload photo</string>
//   <key>NSMicrophoneUsageDescription</key>
//   <string>I need this permission to test upload photo</string>

//   When using package image_picker: ^0.8.0+4, we should add this permission at
//    AndroidManifest
//   android/app/src/debug/AndroidManifest.xml | android/app/src/main/AndroidManifest.xml | android/app/src/profile/AndroidManifest.xml
//   <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>

// - permission_handler => to handle permission such as storage, camera (https://pub.dev/packages/permission_handler)

// we add some logic function so if the user press back or done with
// this pages, cache images will be deleted and not makes the storage full

// Don't forget to add all images and sound used in this pages at the
// pubspec.yaml

// *** IMPORTANT NOTES FOR IOS ***
// Image Picker will crash if you pick image for a second times, this error only
//  exist on iOS Simulator 14 globaly around the world but not error on
//  the real device
// If you want to use iOS Simulator, you need to downgrade and using iOS
// Simulator 13
// Follow this step to downgrade :
// 1. Xcode > Preferences
// 2. Select the "Components" tab.
// 3. Download and select Simulator 13 after the download is finish
// 4. Press "Check and Install Now".
// 5. After that, use Simulator 13 instead of simulator 14
//  */

// import 'dart:async';
// import 'dart:io';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:universal_io/io.dart' as io;

// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:photofilters/photofilters.dart';
// import 'package:path/path.dart' as path;
// import 'package:image/image.dart' as image_lib;

// class PickPhotoFilter extends StatefulWidget {
//   const PickPhotoFilter({
//     final Key? key,
//     this.galleryButton,
//     this.cameraButton,
//     this.size,
//     this.onSelected,
//     this.getImageWidget,
//     this.buttonFiler,
//     this.titleFilterPage,
//   }) : super(key: key);

//   final Widget? galleryButton;
//   final Widget? cameraButton;
//   final double? size;
//   final void Function(File?)? onSelected;
//   final Widget? getImageWidget;
//   final Widget? buttonFiler;
//   final Widget? titleFilterPage;

//   @override
//   PickPhotoFilterState createState() => PickPhotoFilterState();
// }

// class PickPhotoFilterState extends State<PickPhotoFilter> {
//   final Color _color1 = const Color(0xFF0181cc);
//   final Color _color2 = const Color(0xff777777);

//   File? _image;
//   final _picker = ImagePicker();

//   File? _selectedFile;

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     if (_selectedFile != null && _selectedFile!.existsSync()) {
//       _selectedFile!.deleteSync();
//     }
//     _selectedFile = null;
//     super.dispose();
//   }

//   Future<PermissionStatus> requestPermission(
//     final Permission permission,
//   ) async {
//     final result = await permission.request();

//     return result;
//   }

//   void _askPermissionCamera() {
//     unawaited(
//       requestPermission(Permission.camera).then(_onStatusRequestedCamera),
//     );
//   }

//   void _askPermissionStorage() {
//     unawaited(requestPermission(Permission.storage)
//      .then(_onStatusRequested));
//   }

//   void _askPermissionPhotos() {
//     unawaited(requestPermission(Permission.photos).then(_onStatusRequested));
//   }

//   void _onStatusRequested(final PermissionStatus status) {
//     if (status != PermissionStatus.granted) {
//       if (io.Platform.isIOS) {
//         unawaited(openAppSettings());
//       } else {
//         if (status == PermissionStatus.permanentlyDenied) {
//           unawaited(openAppSettings());
//         }
//       }
//     } else {
//       unawaited(_getImage(ImageSource.gallery));
//     }
//   }

//   void _onStatusRequestedCamera(final PermissionStatus status) {
//     if (status != PermissionStatus.granted) {
//       if (io.Platform.isIOS) {
//         unawaited(openAppSettings());
//       } else {
//         if (status == PermissionStatus.permanentlyDenied) {
//           unawaited(openAppSettings());
//         }
//       }
//     } else {
//       unawaited(_getImage(ImageSource.camera));
//     }
//   }

//   Future<void> _getImage(final ImageSource source) async {
//     final pickedFile = await _picker.pickImage(
//       source: source,
//       maxWidth: 640,
//       imageQuality: 100,
//     );
//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//       }
//     });

//     if (_image != null) {
//       setState(() {
//         if (_selectedFile != null && _selectedFile!.existsSync()) {
//           _selectedFile!.deleteSync();
//         }
//         _selectedFile = _image;

//         _image = null;
//       });
//     }
//   }

//   @override
//   Widget build(final BuildContext context) {
//     return Column(
//       children: <Widget>[
//         _getImageWidget(),
//         const SizedBox(height: 30),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             GestureDetector(
//               onTap: _askPermissionCamera,
//               child: widget.cameraButton ??
//                   Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: <Widget>[
//                       Icon(
//                         Icons.camera_alt,
//                         color: _color2,
//                         size: 40,
//                       ),
//                       const SizedBox(width: 10),
//                       const Text('Camera'),
//                     ],
//                   ),
//             ),
//             Container(
//               width: 20,
//             ),
//             GestureDetector(
//               child: widget.galleryButton ??
//                   Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: <Widget>[
//                       Icon(
//                         Icons.photo,
//                         color: _color2,
//                         size: 40,
//                       ),
//                       const SizedBox(width: 10),
//                       const Text('Gallery'),
//                     ],
//                   ),
//               onTap: () {
//                 if (io.Platform.isIOS) {
//                   _askPermissionPhotos();
//                 } else {
//                   _askPermissionStorage();
//                 }
//               },
//             ),
//           ],
//         ),
//         _buttonFilter(),
//       ],
//     );
//   }

//   Widget _getImageWidget() {
//     final size = widget.size ?? 100.r;

//     return _selectedFile != null
//         ? Image.file(
//             _selectedFile!,
//             width: size,
//             height: size,
//             fit: BoxFit.fill,
//           )
//         : widget.getImageWidget ??
//             Container(
//               decoration:
//                   BoxDecoration(border: Border.all(color: Colors.black38)),
//               width: size,
//               height: size,
//               child: const Icon(
//                 Icons.add,
//                 color: Colors.black38,
//               ),
//             );
//   }

//   Future<void> doFilter(final BuildContext context) async {
//     if (_selectedFile != null && _selectedFile!.existsSync()) {
//       final fileName = path.basename(_selectedFile!.path);
//       var image = image_lib.decodeImage(await _selectedFile!.readAsBytes());
//       image = image_lib.copyResize(image!, width: 600);
//       // go to filter
//       final dynamic imageFile = await Navigator.push<dynamic>(
//         context,
//         MaterialPageRoute<dynamic>(
//           builder: (final context) => PhotoFilterSelector(
//             title: widget.titleFilterPage ?? const Text('Photo Filter'),
//             image: image!,
//             filters: presetFiltersList,
//             filename: fileName,
//             fit: BoxFit.contain,
//             appBarColor: Theme.of(context).primaryColor,
//           ),
//         ),
//       );

//       if (imageFile != null) {
//         if (imageFile is Map<String, File>) {
//           if (imageFile.containsKey('image_filtered')) {
//             setState(() {
//               _selectedFile = imageFile['image_filtered'];
//             });
//           }
//         }
//       }
//       widget.onSelected?.call(_selectedFile);
//     } else {
//       await Fluttertoast.showToast(
//         backgroundColor: Colors.red,
//         textColor: Colors.white,
//         msg: 'File not found',
//         fontSize: 13,
//         toastLength: Toast.LENGTH_SHORT,
//       );
//     }
//   }

//   Widget _buttonFilter() {
//     if (_selectedFile != null) {
//       if (widget.buttonFiler != null) {
//         return GestureDetector(
//           onTap: () async {
//             await doFilter(context);
//           },
//           child: widget.buttonFiler,
//         );
//       }

//       return Container(
//         margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
//         child: SizedBox(
//           child: TextButton(
//             style: ButtonStyle(
//               backgroundColor: WidgetStateProperty.resolveWith<Color>(
//                 (final states) => _color1,
//               ),
//               overlayColor: WidgetStateProperty.all(Colors.transparent),
//               shape: WidgetStateProperty.all(
//                 RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(3),
//                 ),
//               ),
//             ),
//             onPressed: () async {
//               await doFilter(context);
//             },
//             child: const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
//               child: Text(
//                 'Go to filter',
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ),
//         ),
//       );
//     } else {
//       return Container();
//     }
//   }
// }
