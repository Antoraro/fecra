import 'package:flutter/material.dart';

import 'app_colors.dart';

ThemeData appTheme(BuildContext context) => ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.main,
        background: AppColors.main,
        onBackground: AppColors.mainDark,
        secondary: AppColors.accent,
        onSecondary: AppColors.mainDark,
        error: AppColors.mainRed,
        onError: AppColors.black,
      ),
    );
