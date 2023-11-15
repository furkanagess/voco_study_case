import 'package:flutter/material.dart';
import 'package:voco_study_case/product/constants/app_colors.dart';

class AppTheme {
  ThemeData get theme {
    return ThemeData(
      brightness: Brightness.dark,
      appBarTheme: appBarTheme(),
      scaffoldBackgroundColor: AppColors.background,
    );
  }

  AppBarTheme appBarTheme() {
    return const AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.background,
      centerTitle: true,
    );
  }
}
