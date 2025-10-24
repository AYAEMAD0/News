import 'package:flutter/material.dart';
import '../../../core/constants/app_asset.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_styles.dart';
import 'app_config.dart';
import 'divider_widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 0.25 * height,
          alignment: Alignment.center,
          color: AppColors.primaryLight,
          child: Text(
            AppStrings.newsApp,
            style: TextStyles.font24BlackBold,
          ),
        ),
        AppConfig(text: AppStrings.goTOHome, icon: AppAsset.homeIcon),
        DividerWidget(),
        AppConfig(text: AppStrings.theme, icon: AppAsset.themeIcon),
        //todo drop menu
        DividerWidget(),
      ],
    );
  }
}
