import 'package:flutter/material.dart';
import 'package:news/api/api_manger.dart';
import 'package:news/core/widgets/error_api_widget.dart';
import 'package:news/core/widgets/loading_widget.dart';
import 'package:news/model/category_model.dart';
import 'package:news/model/source_response.dart';
import '../../../../core/widgets/error_base_widget.dart';
import 'widget/source_tab.dart';

class CategoryDetailsView extends StatefulWidget {
  final CategoryModel category;
  const CategoryDetailsView({super.key, required this.category});

  @override
  State<CategoryDetailsView> createState() => _CategoryDetailsViewState();
}

class _CategoryDetailsViewState extends State<CategoryDetailsView> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 0.02 * width,
        vertical: 0.02 * height,
      ),
      child: FutureBuilder(
        future: ApiManger.getSource(widget.category.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingWidget();
          } else if (snapshot.hasError) {
            return ErrorBaseWidget(
              onPressed: () {
                //todo reload
                ApiManger.getSource(widget.category.id);
                setState(() {});
              },
            );
          } else if (snapshot.data?.status != 'ok') {
            return ErrorApiWidget(
              onPressed: () {
                //todo reload
                ApiManger.getSource(widget.category.id);
                setState(() {});
              },
              message: snapshot.data!.message!,
            );
          }
          List<Sources>? data = snapshot.data?.sources;
          return SourceTab(sourceList: data!);
        },
      ),
    );
  }
}
