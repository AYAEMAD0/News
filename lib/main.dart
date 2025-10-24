import 'package:flutter/material.dart';
import 'package:news/core/theme/app_theme.dart';
import 'package:news/features/views/home/home_view.dart';
import 'package:news/provider/theme_provider/theme_provider.dart';
import 'package:provider/provider.dart';
import 'core/routing/routes.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {Routes.homeRouteName: (context) => HomeView()},
      theme: AppTheme.themeLight,
      darkTheme: AppTheme.themeDark,
      themeMode: Provider.of<ThemeProvider>(context).themeApp,
      initialRoute: Routes.homeRouteName,
    );
  }
}
