import 'package:flutter/material.dart';
import 'package:news/core/widgets/error_api_widget.dart';
import 'package:news/core/widgets/loading_widget.dart';
import 'package:news/features/views/home/category_details/category_details_view_model.dart';
import 'package:news/model/category_model.dart';
import 'package:provider/provider.dart';
import 'widget/source_tab.dart';

class CategoryDetailsView extends StatefulWidget {
  final CategoryModel category;
  const CategoryDetailsView({super.key, required this.category});

  @override
  State<CategoryDetailsView> createState() => _CategoryDetailsViewState();
}

class _CategoryDetailsViewState extends State<CategoryDetailsView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(widget.category.id);
  }
  CategoryDetailsViewModel viewModel = CategoryDetailsViewModel();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 0.02 * width,
          vertical: 0.02 * height,
        ),
        child: Consumer<CategoryDetailsViewModel>(
          builder: (context, data, child) {
            if (data.errorMessage != null) {
              return ErrorApiWidget(
                onPressed: () {
                  //todo reload
                  data.getSources(widget.category.id);
                },
                message: data.errorMessage!,
              );
            } else if (data.sourceList == null) {
              return LoadingWidget();
            } else {
              return SourceTab(sourceList: data.sourceList!);
            }
          },
        ),
      ),
    );
  }
}
