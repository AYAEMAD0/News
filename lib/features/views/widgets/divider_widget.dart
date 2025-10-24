import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Divider(
      color: AppColors.primaryLight,
      endIndent: width * 0.07,
      indent: width * 0.03,
    );
  }
}
