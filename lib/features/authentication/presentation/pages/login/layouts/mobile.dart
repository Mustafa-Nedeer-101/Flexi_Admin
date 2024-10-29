import 'package:admin/core/constants/sizes.dart';
import 'package:admin/features/authentication/presentation/pages/login/widgets/form.dart';
import 'package:admin/features/authentication/presentation/pages/login/widgets/header.dart';
import 'package:flutter/material.dart';

class LoginMobile extends StatelessWidget {
  const LoginMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            children: [
              // Logo Header
              LoginHeader(),

              // Form
              FormBuilder()
            ],
          ),
        ),
      ),
    );
  }
}
