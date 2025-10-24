import 'package:flutter/material.dart';
import 'category_fragment/category_fragment_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: CategoryFragmentView());
  }
}
