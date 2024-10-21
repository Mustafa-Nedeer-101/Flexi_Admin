import 'package:admin/core/constants/sizes.dart';
import 'package:admin/features/authentication/presentation/forgot_password/widgets/form.dart';
import 'package:admin/features/authentication/presentation/forgot_password/widgets/header.dart';
import 'package:flutter/material.dart';

class ForgotPasswordMobile extends StatelessWidget {
  const ForgotPasswordMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: CSizes.defaultSpace, vertical: CSizes.md),
          child: Column(
            children: [
              // Header
              ForgotPasswordHeader(),

              // Form
              ForgotPasswordForm(),
            ],
          )),
    ));
  }
}
