import 'package:flutter/material.dart';
import 'package:zap_menu/app/app.dart';

class ThemeConfig {
  ThemeConfig._();

  static final theme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.white,
    ),
  );
}
