import 'package:admin/core/common/popups/full_screen_loader.dart';
import 'package:admin/core/common/widgets/input/text_form_field.dart';
import 'package:admin/core/constants/images.dart';
import 'package:admin/core/constants/sizes.dart';
import 'package:admin/core/constants/texts.dart';
import 'package:admin/core/network/params/params.dart';
import 'package:admin/core/utils/helpers/extensions.dart';
import 'package:admin/core/utils/helpers/hadle_error_state.dart';
import 'package:admin/core/utils/helpers/validation.dart';
import 'package:admin/features/authentication/presentation/bloc/login_cubit/login_cubit.dart';
import 'package:admin/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class FormBuilder extends StatefulWidget {
  const FormBuilder({super.key});

  @override
  State<FormBuilder> createState() => _FormBuilderState();
}

class _FormBuilderState extends State<FormBuilder> {
  Widget child = const SizedBox();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<LoginCubit>().init(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Container(
            height: 75,
            decoration: BoxDecoration(
                color: Colors.blueGrey, borderRadius: BorderRadius.circular(5)),
          );
        } else {
          return LoginForm();
        }
      },
    );
  }
}

class LoginForm extends StatelessWidget {
  LoginForm({
    super.key,
  });

  final GlobalKey<FormState> formState = GlobalKey();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    email.text = context.read<LoginCubit>().email;
    password.text = context.read<LoginCubit>().password;

    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        switch (state) {
          case LoginInitial():
            email.text = context.read<LoginCubit>().email;
            password.text = context.read<LoginCubit>().email;
          case LoginLoading():
            UFullSreenLoader.openLoadingDialog(
                context: context,
                text: 'Logging you in...',
                animation: CImages.loading);
          case LoginSuccess():
            context.pop();
            context.pushReplacementNamed(Routes.dashboard);
          case LoginFailure():
            context.pop();
            handleErrorState(context, state.message);
        }
      },
      child: Form(
        key: formState,
        child: Padding(
          padding:
              const EdgeInsets.symmetric(vertical: CSizes.spaceBtwSections),
          child: Column(
            children: [
              // Email
              TextFormField(
                controller: email,
                validator: UValidator.validateEmail,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: CTexts.email,
                ),
              ),

              const SizedBox(height: CSizes.spaceBtwInputFields),

              // Password
              CustomTextFormField(
                  controller: password,
                  validator: UValidator.validatePassword,
                  prefixIcon: const Icon(Iconsax.password_check),
                  password: true,
                  labelText: CTexts.password),

              const SizedBox(height: CSizes.spaceBtwInputFields / 2),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Remember Me
                  const RememberMe(),

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
                    onPressed: () {
                      // Read Remember from cubit

                      if (formState.currentState!.validate()) {
                        context.read<LoginCubit>().login(
                              params: LoginParams(
                                  email: email.text.trim(),
                                  password: password.text.trim()),
                            );
                      }
                    },
                    child: const Text(CTexts.signIn)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RememberMe extends StatefulWidget {
  const RememberMe({
    super.key,
  });

  @override
  State<RememberMe> createState() => _RememberMeState();
}

class _RememberMeState extends State<RememberMe> {
  late bool remember;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(
                value: context.read<LoginCubit>().rememberMe,
                onChanged: (value) {
                  setState(() {
                    // Update state variable
                    remember = value ?? remember;

                    // Update Cubit
                    context.read<LoginCubit>().rememberMe = remember;
                  });
                }),
            const Text(CTexts.rememberMe)
          ],
        );
      },
    );
  }
}
