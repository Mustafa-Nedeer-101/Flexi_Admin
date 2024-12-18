import 'package:admin/core/service_locator/get_it.dart';
import 'package:admin/features/authentication/presentation/bloc/login_cubit/login_cubit.dart';
import 'package:admin/features/authentication/presentation/bloc/redirect_cubit/redirct_cubit.dart';
import 'package:admin/features/authentication/presentation/pages/forgot_password/forgot_password.dart';
import 'package:admin/features/authentication/presentation/pages/login/login.dart';
import 'package:admin/features/authentication/presentation/pages/redirect/redirect_screen.dart';
import 'package:admin/features/authentication/presentation/pages/reset_password/reset_password.dart';
import 'package:admin/features/products/presentation/cubit/products_cubit.dart';
import 'package:admin/features/template/app_template.dart';
import 'package:admin/features/template/cubit/header/header_cubit.dart';
import 'package:admin/features/template/cubit/sidebar/sidebar_cubit.dart';
import 'package:admin/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    // Will be passed to any screen via the arguments parameter
    // ignore: unused_local_variable
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.redirect:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) => getIt<RedirectCubit>(),
                child: const RedirectScreen()));

      // Dashboard
      case Routes.template:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider(create: (context) => getIt<HeaderCubit>()),
                    BlocProvider(create: (context) => getIt<SidebarCubit>()),
                    BlocProvider(create: (context) => getIt<ProductsCubit>()),
                  ],
                  child: const CustomAppTemplate(),
                ));

      case Routes.login:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) => getIt<LoginCubit>(),
                child: const LoginScreen()));

      case Routes.forgotPassword:
        return MaterialPageRoute(
            builder: (context) => const ForgotPasswordScreen());

      case Routes.resetPassword:
        return MaterialPageRoute(
            builder: (context) => const ResetPasswordScreen());
      default:
        return null;
    }
  }
}
