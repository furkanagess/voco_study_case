// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voco_study_case/feature/controller/auth_controller.dart';
import 'package:voco_study_case/feature/controller/participant_provider.dart';
import 'package:voco_study_case/feature/view/participant_list_view.dart';
import 'package:voco_study_case/product/constants/app_colors.dart';
import 'package:voco_study_case/product/constants/app_strings.dart';
import 'package:voco_study_case/product/extension/context_extension.dart';
import 'package:voco_study_case/product/widgets/app_scaffold.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.loginPage),
        ),
        body: Padding(
          padding: context.paddingNormal,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EmailTextfield(emailController: emailController),
              divider(context),
              PasswordTextfield(passwordController: passwordController),
              divider(context),
              LoginButton(
                emailController: emailController,
                passwordController: passwordController,
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox divider(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.02),
    );
  }
}

class EmailTextfield extends StatelessWidget {
  const EmailTextfield({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: emailController,
      decoration: const InputDecoration(
        labelText: AppStrings.email,
        border: OutlineInputBorder(),
      ),
    );
  }
}

class PasswordTextfield extends StatelessWidget {
  const PasswordTextfield({
    super.key,
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: passwordController,
      decoration: const InputDecoration(
        labelText: AppStrings.password,
        border: OutlineInputBorder(),
      ),
      obscureText: true,
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: InkWell(
        onTap: () async {
          final email = emailController.text;
          final password = passwordController.text;
          final authController =
              Provider.of<AuthController>(context, listen: false);

          try {
            await authController.login(email, password);
            if (authController.token != null) {
              await Provider.of<ParticipantController>(context, listen: false)
                  .fetchParticipants();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const ParticipantListPage(),
                ),
              );
            }
          } catch (e) {
            showDialog(
              context: context,
              builder: (context) {
                return const LoginErrorDialog();
              },
            );
          }
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.darkWhite,
          ),
          height: context.dynamicHeight(0.07),
          width: context.dynamicWidth(0.7),
          child: Center(
            child: Text(
              AppStrings.login,
              style: context.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.background,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginErrorDialog extends StatelessWidget {
  const LoginErrorDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(AppStrings.loginFailed),
      content: const Text(
        AppStrings.invalidCred,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            AppStrings.back,
            style: context.textTheme.bodyMedium?.copyWith(
              color: AppColors.powderRed,
            ),
          ),
        ),
      ],
    );
  }
}
