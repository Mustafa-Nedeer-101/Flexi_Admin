// Handle Error State
import 'package:admin/core/constants/colors.dart';
import 'package:admin/core/utils/helpers/extensions.dart';
import 'package:flutter/material.dart';

void handleErrorState(BuildContext context, String error) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      icon: const Icon(
        Icons.error,
        size: 32,
      ),
      iconColor: CColors.error,
      content: SelectableText(
        error,
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(color: CColors.primary),
      ),
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: Text(
            'Got it',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: CColors.primary),
          ),
        ),
      ],
    ),
  );
}
