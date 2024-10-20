import 'dart:io';
import 'dart:typed_data';

import 'package:admin/core/common/shimmers/shimmer.dart';
import 'package:admin/core/constants/enums.dart';
import 'package:admin/core/constants/sizes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomRoundedImage extends StatelessWidget {
  const CustomRoundedImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.border,
    this.padding = CSizes.sm,
    this.onPressed,
    this.image,
    this.fit = BoxFit.contain,
    this.isNetworkImage = false,
    this.applyImageRadius = true,
    this.borderRadius = CSizes.md,
    this.backgroundColor,
    this.file,
    this.margin,
    this.memoryImage,
    this.imageType = ImageType.asset,
    this.overlayColor,
  });

  final double width, height, padding;
  final double? margin;
  final String? image;
  final File? file;
  final Uint8List? memoryImage;
  final ImageType imageType;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color? backgroundColor;
  final Color? overlayColor;
  final BoxFit? fit;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    //
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(padding),
        margin: margin != null ? EdgeInsets.all(margin!) : null,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: buildImageWidget(),
      ),
    );
  }

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
      borderRadius: applyImageRadius
          ? BorderRadius.circular(borderRadius)
          : BorderRadius.zero,
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
            CustomShimmerEffect(width: width, height: height),
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
