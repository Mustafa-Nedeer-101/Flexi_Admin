import 'package:admin/core/constants/colors.dart';
import 'package:admin/core/utils/helpers/extensions.dart';
import 'package:admin/features/authentication/presentation/bloc/redirect_cubit/redirct_cubit.dart';
import 'package:admin/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RedirectScreen extends StatelessWidget {
  const RedirectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RedirectCubit, RedirectState>(
      listener: (context, state) {
        switch (state) {
          case RedirectAuthenticated():
            context.pushReplacementNamed(Routes.dashboard);
          case RedirectUnauthenticated():
            context.pushReplacementNamed(Routes.login);
          case RedirectFailure():
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => AlertDialog(
                icon: const Icon(
                  Icons.close_outlined,
                  size: 32,
                ),
                iconColor: CColors.error,
                content: Text(
                  textAlign: TextAlign.center,
                  "Somthing went wrong!",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: CColors.primary),
                ),
                actions: const [],
              ),
            );
          case RedirectInitial():
            null;
        }
      },
      child: const ChildWidget(),
    );
  }
}

class ChildWidget extends StatelessWidget {
  const ChildWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Add Event
    context.read<RedirectCubit>().redirect();

    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
