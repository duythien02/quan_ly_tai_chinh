// Dart imports:
import 'dart:async';
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:camera/camera.dart';
import 'package:ez_intl/ez_intl.dart';

// Project imports:
import '../../core/utils/app_permission_helper.dart';

class CameraPreviewPage extends StatefulWidget {
  const CameraPreviewPage({super.key});

  @override
  State<CameraPreviewPage> createState() => _CameraPreviewPageState();
}

class _CameraPreviewPageState extends State<CameraPreviewPage> {
  CameraController? _controller;
  List<CameraDescription> _cameras = [];
  bool _isInitialized = false;
  final List<String> _imagePaths = [];

  @override
  void initState() {
    super.initState();
    unawaited(_initializeCamera());
  }

  Future<void> _initializeCamera() async {
    try {
      _cameras = await availableCameras();
      final description = _cameras.firstWhere(
        (final e) => e.lensDirection == CameraLensDirection.back,
        orElse: () => _cameras.first,
      );
      _controller = CameraController(
        description,
        ResolutionPreset.high,
        enableAudio: false,
      );

      _controller?.initialize().then((final _) {
        if (!mounted) {
          return;
        }
        _controller?.setFlashMode(FlashMode.auto);
        _isInitialized = true;

        setState(() {});
      }).catchError((final e) {
        if (e is CameraException) {
          switch (e.code) {
            case 'CameraAccessDenied':
              if (mounted) {
                AppPermissionHelper.requestCameraPermission(context);
              }
              break;
            default:
              // Handle other errors here.
              break;
          }
        }
      });
    } catch (_) {}
  }

  Future<void> _takePicture() async {
    if (!_controller!.value.isInitialized) {
      return;
    }

    try {
      final XFile picture = await _controller!.takePicture();
      setState(() {
        _imagePaths.add(picture.path);
      });
      // if (mounted) {
      //   Navigator.of(context).pop(_imagePaths);
      // }
    } catch (_) {}
  }

  @override
  void dispose() {
    unawaited(_controller?.dispose());
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.close),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop(_imagePaths);
            },
            icon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(context.l10n.next),
                const SizedBox(width: 4),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 64,
            child: Center(
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _imagePaths.length,
                separatorBuilder:
                    (final BuildContext context, final int index) {
                  return const SizedBox(width: 6);
                },
                itemBuilder: (final BuildContext context, final int index) {
                  return Image.file(
                    File(_imagePaths[index]),
                    fit: BoxFit.cover,
                    height: 64,
                    width: 64,
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: _isInitialized
                ? Center(child: CameraPreview(_controller!))
                : const Center(child: CircularProgressIndicator()),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[200],
            ),
            child: IconButton(
              onPressed: _takePicture,
              icon: Icon(
                Icons.camera_alt_outlined,
                size: 32,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
