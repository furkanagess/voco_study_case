import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voco_study_case/feature/controller/auth_controller.dart';
import 'package:voco_study_case/product/constants/app_colors.dart';
import 'package:voco_study_case/product/constants/app_strings.dart';
import 'package:voco_study_case/product/extension/context_extension.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: InkWell(
        onTap: () {
          Provider.of<AuthController>(context, listen: false).logout();
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.powderRed,
          ),
          height: context.dynamicHeight(0.07),
          width: context.dynamicWidth(0.7),
          child: Center(
            child: Text(
              AppStrings.logout,
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
