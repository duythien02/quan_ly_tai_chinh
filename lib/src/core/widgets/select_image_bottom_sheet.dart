// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:ez_intl/ez_intl.dart';
import 'package:ez_resources/ez_resources.dart';

// Project imports:
import '../../core/utils/alert.dart';
import '../../core/utils/get_image.dart';
import 'widgets.dart';

class SelectImageBottomSheet extends StatefulWidget {
  const SelectImageBottomSheet({
    final Key? key,
    required this.onSelected,
    this.onGetImages,
  }) : super(key: key);

  final Function(String) onSelected;
  final Function()? onGetImages;

  static Future<void> show(
    final BuildContext context, {
    required final Function(String) onSelected,
  }) async {
    return showBaseBottomSheet(
      context: context,
      title: context.l10n.image,
      height: 300,
      child: SelectImageBottomSheet(onSelected: onSelected),
    );
  }

  static Future<void> onTapGetImageWidget(
    final BuildContext context, {
    required final ImageSource imageSource,
    required final Function(String) onSelected,
    final Function()? onGetImages,
    final bool isPopFirst = true,
  }) async {
    if (isPopFirst) {
      Navigator.pop(context);
    }
    if (onGetImages != null && imageSource != ImageSource.camera) {
      onGetImages.call();
    } else {
      final imgDirectory = await getImageFromSource(
        context,
        libraryPermissionDeniedHandler: () async {
          if (context.mounted) {
            if (context.mounted) {
              Alert.showAlertSetting(
                context,
                context.l10n.requestPermissionLibrary,
                title: context.l10n.notification,
                closeButton: context.l10n.close,
                openSettingButton: context.l10n.openSettings,
              );
            }
          }
        },
        cameraPermissionDeniedHandler: () async {
          if (context.mounted) {
            Alert.showAlertSetting(
              context,
              context.l10n.requestPermissionCamera,
              title: context.l10n.notification,
              closeButton: context.l10n.close,
              openSettingButton: context.l10n.openSettings,
            );
          }
        },
        imageSource: imageSource,
      );

      if (imgDirectory != null && imgDirectory.isNotEmpty) {
        onSelected(imgDirectory);
      }
    }
  }

  @override
  SelectImageBottomSheetState createState() => SelectImageBottomSheetState();
}

class SelectImageBottomSheetState extends State<SelectImageBottomSheet> {
  @override
  Widget build(final BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildGetImageWidget(
                imgUrl: AppIcons.icCamera,
                title: context.l10n.getImageInCamera,
                imageSource: ImageSource.camera,
              ),
              Container(
                height: 1,
                color: Theme.of(context).dividerColor,
              ),
              buildGetImageWidget(
                imgUrl: AppIcons.icGallery,
                title: context.l10n.getImageInGallery,
                imageSource: ImageSource.gallery,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildGetImageWidget({
    final String? imgUrl,
    required final String title,
    required final ImageSource imageSource,
  }) {
    return InkWell(
      onTap: () async => SelectImageBottomSheet.onTapGetImageWidget(
        context,
        imageSource: imageSource,
        onSelected: widget.onSelected,
        onGetImages: widget.onGetImages,
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, bottom: 23, top: 23),
        child: Row(
          children: [
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).dividerColor,
              ),
              child: Center(
                child: EZResources.image(
                  ImageParams(
                    name: imgUrl ?? '',
                    size: const ImageSize.square(20),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 17),
            Expanded(
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).primaryColorDark,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
