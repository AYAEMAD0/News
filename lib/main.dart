import 'package:flutter/material.dart';
import 'package:news/core/theme/app_theme.dart';
import 'package:news/features/views/home/category/general/general_view.dart';
import 'package:news/features/views/home/home_view.dart';

import 'core/routing/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Routes.homeRouteName: (context) => HomeView(),
        Routes.generalRouteName: (context) => GeneralView(),
      },
      theme: AppTheme.themeLight,
      darkTheme: AppTheme.themeDark,
      themeMode: ThemeMode.light,
     initialRoute: Routes.generalRouteName,
    );
  }
}
