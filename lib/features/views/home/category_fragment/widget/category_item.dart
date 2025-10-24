import 'package:flutter/material.dart';
import 'package:news/core/constants/app_strings.dart';
import '../../../../../model/category_model.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel model;
  final int index;
  const CategoryItem({super.key, required this.model, required this.index});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      alignment: index.isEven ? Alignment.bottomRight : Alignment.bottomLeft,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Image.asset(model.image),
        ),
        Container(
          width: 0.39 * width,
          height: 0.063 * height,
          margin: EdgeInsetsDirectional.only(
            bottom: 0.02 * height,
            start: index.isEven ? 0 : 0.02 * width,
            end: index.isEven ? 0.02 * width : 0,
          ),
          padding: EdgeInsetsDirectional.only(
            end: index.isEven ? 0 : 0.04 * width,
            start: index.isEven ? 0.04 * width : 0,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(84),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            textDirection: index.isEven ? TextDirection.ltr : TextDirection.rtl,
            children: [
              Text(
                AppStrings.viewAll,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              CircleAvatar(
                radius: 25,
                backgroundColor: Theme.of(context).dividerColor,
                child: Icon(
                  index.isEven
                      ? Icons.arrow_forward_ios_rounded
                      : Icons.arrow_back_ios,
                  size: 25,
                  color: Theme.of(context).canvasColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
