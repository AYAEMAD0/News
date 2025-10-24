import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_styles.dart';

class AppTheme {
  static final ThemeData themeLight = ThemeData(
    scaffoldBackgroundColor: AppColors.primaryLight,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryLight,
      scrolledUnderElevation: 0,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.primaryDark),
      actionsIconTheme: IconThemeData(color: AppColors.primaryDark),
    ),
    textTheme: TextTheme(
      labelMedium: TextStyles.font20BlackMedium,
      labelSmall: TextStyles.font14BlackMedium,
      labelLarge: TextStyles.font16BlackBold,
      headlineMedium: TextStyles.font18LightMedium
    ),
    canvasColor: AppColors.primaryDark,
  );
  static final ThemeData themeDark = ThemeData(
    scaffoldBackgroundColor: AppColors.primaryDark,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryDark,
      scrolledUnderElevation: 0,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.primaryLight),
      actionsIconTheme: IconThemeData(color: AppColors.primaryLight),
    ),
    textTheme: TextTheme(
      labelMedium: TextStyles.font20WhiteMedium,
      labelSmall: TextStyles.font14WhiteMedium,
      labelLarge: TextStyles.font16WhiteBold,
      headlineMedium: TextStyles.font18BlackMedium
    ),
    canvasColor: AppColors.primaryLight,
  );
}
