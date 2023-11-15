import 'package:flutter/material.dart';
import 'package:voco_study_case/product/constants/app_strings.dart';

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
