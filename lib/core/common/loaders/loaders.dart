import 'package:admin/core/constants/colors.dart';
import 'package:admin/core/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CustomLoaders {
  static hideSnackbar(BuildContext context) =>
      ScaffoldMessenger.of(context).hideCurrentSnackBar();

  static customToast({required BuildContext context, required message}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      elevation: 0,
      duration: const Duration(
        milliseconds: 1500,
      ),
      backgroundColor: Colors.transparent,
      content: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: UHelperFunctions.isDarkMode(context)
                ? CColors.darkerGrey.withOpacity(0.9)
                : CColors.grey.withOpacity(0.9)),
        child: Center(
          child: Text(
            message,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
      ),
    ));
  }

  static successSnackbar(
      {required BuildContext context,
      required title,
      message = '',
      duration = 2}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: CColors.primary,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      content: Center(
        child: Column(
          children: [
            const Icon(Icons.check_circle),
            Text(title),
            Text(message),
          ],
        ),
      ),
    ));
  }

  static warningSnackbar(
      {required BuildContext context,
      required title,
      message = '',
      duration = 2}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: CColors.primary,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      content: Center(
        child: Column(
          children: [
            const Icon(Icons.check_circle),
            Text(title),
            Text(message),
          ],
        ),
      ),
    ));
  }

  static errorSnackbar(
      {required BuildContext context,
      required title,
      message = '',
      duration = 2}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: CColors.primary,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      content: Center(
        child: Column(
          children: [
            const Icon(Icons.check_circle),
            Text(title),
            Text(message),
          ],
        ),
      ),
    ));
  }
}
