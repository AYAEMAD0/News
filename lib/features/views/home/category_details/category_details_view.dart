import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/bloc/source/source_cubit.dart';
import 'package:news/bloc/source/source_state.dart';
import 'package:news/core/widgets/error_api_widget.dart';
import 'package:news/core/widgets/loading_widget.dart';
import 'package:news/di/injectable.dart';
import 'package:news/model/category_model.dart';
import 'widget/source_tab.dart';

class CategoryDetailsView extends StatefulWidget {
  final CategoryModel category;
  const CategoryDetailsView({super.key, required this.category});

  @override
  State<CategoryDetailsView> createState() => _CategoryDetailsViewState();
}

class _CategoryDetailsViewState extends State<CategoryDetailsView> {
  //todo: SourceCubit viewModel = SourceCubit(sourceRepository: injectSourceRepository());
  SourceCubit viewModel = getIt<SourceCubit>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSource(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 0.02 * width,
        vertical: 0.02 * height,
      ),
      child: BlocBuilder<SourceCubit, SourceState>(
        bloc: viewModel,
        builder: (context, state) {
          if (state is SuccessState) {
            return SourceTab(sourceList: state.sourceList!);
          } else if (state is ErrorState) {
            return ErrorApiWidget(
              onPressed: () {
                //todo reload
                viewModel.getSource(widget.category.id);
              },
              message: state.errorMessage.toString(),
            );
          } else {
            return LoadingWidget();
          }
        },
      ),
    );
  }
}
