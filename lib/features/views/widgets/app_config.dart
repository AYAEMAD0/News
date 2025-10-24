import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/theme/app_styles.dart';

class AppConfig extends StatelessWidget {
  const AppConfig({super.key, required this.text, required this.icon});
  final String text;
  final String icon;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.03 * width),
      child: Row(
        children: [
          SvgPicture.asset(icon),
          SizedBox(width: 0.04 * width),
          Text(text, style: TextStyles.font20WhiteBold),
        ],
      ),
    );
  }
}
