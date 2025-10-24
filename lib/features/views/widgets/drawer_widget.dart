import 'package:flutter/material.dart';
import 'package:news/features/views/widgets/drop_menu_widget.dart';
import '../../../core/constants/app_asset.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_styles.dart';
import 'app_config.dart';
import 'divider_widget.dart';

typedef OnDrawerClick = void Function();

class DrawerWidget extends StatelessWidget {
  final OnDrawerClick onDrawerClick;
  const DrawerWidget({super.key, required this.onDrawerClick});

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
          margin: EdgeInsets.only(bottom: height * 0.03),
          child: Text(AppStrings.newsApp, style: TextStyles.font24BlackBold),
        ),
        InkWell(
          onTap: () {
            //todo calling
            onDrawerClick();
          },
          child: AppConfig(text: AppStrings.goTOHome, icon: AppAsset.homeIcon),
        ),
        SizedBox(height: height * 0.02),
        DividerWidget(),
        SizedBox(height: height * 0.02),
        AppConfig(text: AppStrings.theme, icon: AppAsset.themeIcon),
        SizedBox(height: height * 0.01),
        DropMenuWidget(),
      ],
    );
  }
}
