import 'package:admin/core/constants/sizes.dart';
import 'package:admin/features/authentication/presentation/pages/reset_password/widgets/reset_widget.dart';
import 'package:flutter/material.dart';

class ResetPasswordMobile extends StatelessWidget {
  const ResetPasswordMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: CSizes.defaultSpace, vertical: CSizes.md),
            child: ResetPasswordWidget()),
      ),
    );
  }
}
