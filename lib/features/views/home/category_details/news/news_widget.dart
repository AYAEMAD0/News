import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/bloc/news/news_cubit.dart';
import 'package:news/bloc/news/news_state.dart';
import 'package:news/core/widgets/error_api_widget.dart';
import 'package:news/core/widgets/loading_widget.dart';
import 'package:news/model/source_response.dart';
import 'widget/news_item.dart';

class NewsWidget extends StatefulWidget {
  final Sources source;
  const NewsWidget({super.key, required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  NewsCubit viewModel = NewsCubit();
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    viewModel.getNewsBySourceId(widget.source.id!);
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 200 &&
          viewModel.state is SuccessState &&
          (viewModel.state as SuccessState).hasMore) {
        viewModel.getNewsBySourceId(widget.source.id!);
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("-------------------------------------------------");
    debugPrint(
      "Fetching news for ${widget.source.id} - page ${viewModel.page}",
    );
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return BlocBuilder<NewsCubit, NewsState>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is SuccessState) {
          return ListView.builder(
            controller: scrollController,
            itemCount: state.hasMore
                ? state.newsList.length + 1
                : state.newsList.length,
            itemBuilder: (context, index) {
              if (index < state.newsList.length) {
                return NewsItem(news: state.newsList[index]);
              } else {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 0.04 * width,
                    vertical: 0.09 * height,
                  ),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).canvasColor,
                    ),
                  ),
                );
              }
            },
          );
        } else if (state is ErrorState) {
          return ErrorApiWidget(
            onPressed: () {
              viewModel.getNewsBySourceId(widget.source.id!);
            },
            message: state.errorMessage.toString(),
          );
        } else {
          return LoadingWidget();
        }
      },
    );
  }
}
