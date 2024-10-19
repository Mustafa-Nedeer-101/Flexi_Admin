import 'package:admin/core/common/responsive/layouts/app_template.dart';
import 'package:admin/features/authentication/onboarding.dart';
import 'package:admin/routing/routes.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    // Will be passed to any screen via the arguments parameter
    // ignore: unused_local_variable
    final arguments = settings.arguments;

    switch (settings.name) {
      // Onboarding
      case Routes.onboardingScreen:
        return MaterialPageRoute(
          builder: (context) => CustomAppTemplate(
            desktop: const Desktop(),
            tablet: const Tablet(),
            mobile: const Mobile(),
          ),
        );

      default:
        return null;
    }
  }
}
