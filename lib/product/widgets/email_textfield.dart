import 'package:flutter/material.dart';
import 'package:voco_study_case/product/constants/app_strings.dart';

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
