import 'package:flutter/material.dart';
import 'package:news/core/helper/shared_check_helper.dart';
import 'package:news/core/theme/app_theme.dart';
import 'package:news/features/views/home/home_view.dart';
import 'package:news/provider/theme_provider/theme_provider.dart';
import 'package:provider/provider.dart';
import 'core/routing/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedCheckHelper.init();
  final bool isDark = await SharedCheckHelper.getTheme();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(isDark),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    var theme=Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {Routes.homeRouteName: (context) => HomeView()},
      theme: AppTheme.themeLight,
      darkTheme: AppTheme.themeDark,
      themeMode:theme.themeApp ,
      initialRoute: Routes.homeRouteName,
    );
  }
}
