import 'package:admin/core/constants/sizes.dart';
import 'package:admin/core/constants/texts.dart';
import 'package:admin/core/utils/helpers/extensions.dart';
import 'package:admin/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: CSizes.spaceBtwSections),
        child: Column(
          children: [
            // Email
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: CTexts.email,
              ),
            ),

            const SizedBox(height: CSizes.spaceBtwInputFields),

            // Password
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                    onPressed: () {}, icon: const Icon(Iconsax.eye_slash)),
                labelText: CTexts.email,
              ),
            ),

            const SizedBox(height: CSizes.spaceBtwInputFields / 2),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Remember Me
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(CTexts.rememberMe)
                  ],
                ),

                // Forgot Password
                TextButton(
                    onPressed: () => context.pushNamed(Routes.forgotPassword),
                    child: const Text(CTexts.forgotPassword))
              ],
            ),

            const SizedBox(height: CSizes.spaceBtwSections),

            // Sign Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {}, child: const Text(CTexts.signIn)),
            )
          ],
        ),
      ),
    );
  }
}
