import 'package:flutter/material.dart';
import 'package:news/core/constants/app_strings.dart';
import 'package:provider/provider.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_styles.dart';
import '../../../provider/theme_provider/theme_provider.dart';

class DropMenuWidget extends StatelessWidget {
  const DropMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var theme = Provider.of<ThemeProvider>(context);
    return DropdownMenu(
      width: width * 0.65,
      textStyle: TextStyles.font20WhiteBold,
      trailingIcon: Icon(Icons.arrow_drop_down, color: AppColors.primaryLight),
      selectedTrailingIcon: Icon(
        Icons.arrow_drop_up,
        color: AppColors.primaryLight,
      ),
      menuStyle: MenuStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.primaryLight),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        fixedSize: WidgetStateProperty.all(Size(width * 0.65, double.nan)),
      ),
      onSelected: (value) {
        if (value != null) {
          theme.changeTheme(value);
        }
      },
      inputDecorationTheme: InputDecorationTheme(
        border: builtBorder(),
        enabledBorder: builtBorder(),
        focusedBorder: builtBorder(),
      ),
      initialSelection: theme.themeApp,
      dropdownMenuEntries: [
        DropdownMenuEntry(value: ThemeMode.light, label: AppStrings.light),
        DropdownMenuEntry(value: ThemeMode.dark, label: AppStrings.dark),
      ],
    );
  }

  OutlineInputBorder builtBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: AppColors.primaryLight, width: 1.4),
    );
  }
}
