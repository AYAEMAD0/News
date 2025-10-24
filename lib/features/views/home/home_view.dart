import 'package:flutter/material.dart';
import 'package:news/core/constants/app_strings.dart';
import 'package:news/core/theme/app_colors.dart';
import 'package:news/features/views/home/category_details/category_details_view.dart';
import 'package:news/features/views/widgets/drawer_widget.dart';
import 'package:news/model/category_model.dart';
import 'category_fragment/category_fragment_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Drawer(
        backgroundColor: AppColors.primaryDark,
        child: DrawerWidget(onDrawerClick: onDrawerClick),
      ),
      appBar: AppBar(
        title: Text(
          selectedCategory == null ? AppStrings.home : selectedCategory!.title,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.03 * width),
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: selectedCategory == null
          ? CategoryFragmentView(onCategoryItemClick: onCategoryItemClick)
          : CategoryDetailsView(category: selectedCategory!),
    );
  }

  CategoryModel? selectedCategory;

  void onCategoryItemClick(CategoryModel newCategory) {
    selectedCategory = newCategory;
    setState(() {});
  }

  void onDrawerClick() {
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}
