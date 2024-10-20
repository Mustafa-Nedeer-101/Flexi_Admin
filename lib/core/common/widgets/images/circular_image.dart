import 'dart:io';
import 'dart:typed_data';
import 'package:admin/core/common/shimmers/shimmer.dart';
import 'package:admin/core/constants/colors.dart';
import 'package:admin/core/constants/enums.dart';
import 'package:admin/core/constants/sizes.dart';
import 'package:admin/core/utils/helpers/helper_functions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCircularImage extends StatelessWidget {
  const CustomCircularImage(
      {super.key,
      this.fit = BoxFit.cover,
      this.image,
      this.isNetworkImage = false,
      this.overlayColor,
      this.backgroundColor,
      this.width = 56,
      this.height = 56,
      this.padding = CSizes.sm,
      this.file,
      this.memoryImage,
      this.imageType = ImageType.asset});

  final BoxFit? fit;
  final String? image;
  final File? file;
  final Uint8List? memoryImage;
  final ImageType imageType;

  final bool isNetworkImage;
  final Color? overlayColor, backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: backgroundColor ??
              (UHelperFunctions.isDarkMode(context)
                  ? CColors.black
                  : CColors.white),
          borderRadius: BorderRadius.circular(width >= height ? width : height),
        ),
        child: buildImageWidget());
  }

  // Image Widget
  Widget buildImageWidget() {
    Widget imageWidget;

    switch (imageType) {
      case ImageType.network:
        imageWidget = buildNetworkImage();
        break;
      case ImageType.memory:
        imageWidget = buildMemoryImage();
        break;

      case ImageType.file:
        imageWidget = buildFileImage();
        break;
      case ImageType.asset:
        imageWidget = buildAssetImage();
        break;
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(width >= height ? width : height),
      child: imageWidget,
    );
  }

  // Network Image
  Widget buildNetworkImage() {
    if (image != null) {
      return CachedNetworkImage(
        fit: fit,
        color: overlayColor,
        imageUrl: image!,
        errorWidget: (context, url, error) => const Icon(Icons.error),
        progressIndicatorBuilder: (context, url, progress) =>
            const CustomShimmerEffect(width: 55, height: 55),
      );
    } else {
      return Container();
    }
  }

  // Memory Image
  Widget buildMemoryImage() {
    if (memoryImage != null) {
      return Image(
        fit: fit,
        image: MemoryImage(memoryImage!),
        color: overlayColor,
      );
    } else {
      return Container();
    }
  }

  // File Image
  Widget buildFileImage() {
    if (file != null) {
      return Image(
        fit: fit,
        image: FileImage(file!),
        color: overlayColor,
      );
    } else {
      return Container();
    }
  }

  // Asset Image
  Widget buildAssetImage() {
    if (image != null) {
      return Image(
        fit: fit,
        image: AssetImage(image!),
        color: overlayColor,
      );
    } else {
      return Container();
    }
  }
}
