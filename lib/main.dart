import 'package:flutter/material.dart';
import 'package:news/core/theme/app_theme.dart';
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
      },
      theme: AppTheme.themeLight,
      darkTheme: AppTheme.themeDark,
     initialRoute: Routes.homeRouteName,
    );
  }
}
