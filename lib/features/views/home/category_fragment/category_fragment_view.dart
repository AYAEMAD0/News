import 'package:flutter/material.dart';
import 'package:news/core/constants/app_strings.dart';
import 'package:news/features/views/home/category_fragment/widget/category_item.dart';
import 'package:news/model/category_model.dart';

class CategoryFragmentView extends StatelessWidget {
  List<CategoryModel> model=[];
  CategoryFragmentView({super.key,});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    //todo theme provider
    model=CategoryModel.getCategoryList(true);
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 0.03 * width,
          vertical: 0.02 * height,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.goodMorning,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.only(top: 0.02*height),
                  itemBuilder: (context, index) => CategoryItem(model: model[index],index: index,),
                  separatorBuilder: (context, index) => SizedBox(height: 0.025*height,),
                  itemCount:model.length),
            )
          ],
        ),
      ),
    );
  }
}
