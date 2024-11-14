import 'package:admin/core/constants/colors.dart';
import 'package:admin/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class CustomAnimationLoaderWidget extends StatelessWidget {
  const CustomAnimationLoaderWidget({
    super.key,
    required this.text,
    this.style,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed,
    this.height,
    this.width,
  });

  final String text;
  final TextStyle? style;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;
  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(animation),
            height: height ?? MediaQuery.sizeOf(context).height * 0.5,
            width: width,
          ),
          const SizedBox(height: CSizes.defaultSpace),
          Text(
            text,
            style: style ?? Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: CSizes.defaultSpace),
          showAction
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                    onPressed: onActionPressed,
                    style:
                        OutlinedButton.styleFrom(backgroundColor: CColors.dark),
                    child: Text(
                      actionText!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: CColors.light),
                    ),
                  ))
              : const SizedBox(),
        ],
      ),
    );
  }
}
