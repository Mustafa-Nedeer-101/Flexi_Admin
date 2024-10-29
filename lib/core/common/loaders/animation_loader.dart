import 'package:admin/core/constants/colors.dart';
import 'package:admin/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class CustomAnimationLoaderWidget extends StatelessWidget {
  const CustomAnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed,
  });

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(animation),
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            const SizedBox(height: CSizes.defaultSpace),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: CSizes.defaultSpace),
            showAction
                ? SizedBox(
                    width: 250,
                    child: OutlinedButton(
                      onPressed: onActionPressed,
                      style: OutlinedButton.styleFrom(
                          backgroundColor: CColors.dark),
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
      ),
    );
  }
}
