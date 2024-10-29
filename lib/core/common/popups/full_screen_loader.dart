import 'package:admin/core/constants/colors.dart';
import 'package:admin/core/utils/helpers/helper_functions.dart';
import 'package:admin/core/common/loaders/animation_loader.dart';
import 'package:flutter/material.dart';

class UFullSreenLoader {
  // Open Loading Dialog
  static void openLoadingDialog(
      {required BuildContext context,
      required String text,
      required String animation}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        final dark = UHelperFunctions.isDarkMode(context);
        return PopScope(
          canPop: false,
          child: Container(
            color: dark ? CColors.dark : CColors.white,
            width: double.infinity,
            height: double.infinity,
            child: CustomAnimationLoaderWidget(
              text: text,
              animation: animation,
            ),
          ),
        );
      },
    );
  }

  // Stop Loading Dialog
  static stopLoading(BuildContext context) {
    Navigator.of(context).pop();
  }
}
