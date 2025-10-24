import 'package:flutter/material.dart';
import 'package:news/core/constants/app_strings.dart';
import 'package:news/core/theme/app_colors.dart';
import 'package:news/features/views/widgets/drawer_widget.dart';
import 'category_fragment/category_fragment_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Drawer(
        backgroundColor: AppColors.primaryDark,
        child: DrawerWidget(),
      ),
      appBar: AppBar(
        title: Text(
          AppStrings.home,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.03 * width),
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: CategoryFragmentView(),
    );
  }
}
