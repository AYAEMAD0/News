import 'package:flutter/material.dart';
import 'package:news/core/widgets/loading_widget.dart';
import 'package:news/model/source_response.dart';
import 'package:provider/provider.dart';
import '../../../../../core/widgets/error_api_widget.dart';
import 'news_view_model.dart';
import 'widget/news_item.dart';

class NewsWidget extends StatefulWidget {
  final Sources source;
  const NewsWidget({super.key, required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  final ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (context) {
        final viewModel = NewsViewModel();
        viewModel.getNewsBySourceId(widget.source.id!);
        scrollController.addListener(() {
          if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent &&
              !viewModel.isLoading &&
              viewModel.hasMore) {
            viewModel.getNewsBySourceId(widget.source.id!);
          }
        });
        return viewModel;
      },
      child: Consumer<NewsViewModel>(
        builder: (context, data, child) {
          if (data.errorMessage != null && data.newsList.isEmpty) {
            return ErrorApiWidget(
              message: data.errorMessage!,
              onPressed: () {
                data.getNewsBySourceId(widget.source.id!);
              },
            );
          } else if (data.newsList.isEmpty && data.isLoading) {
            return LoadingWidget();
          } else {
            return ListView.builder(
              controller: scrollController,
              itemCount: data.hasMore
                  ? data.newsList.length + 1
                  : data.newsList.length,
              itemBuilder: (context, index) {
                if (index < data.newsList.length) {
                  return NewsItem(news: data.newsList[index]);
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
          }
        },
      ),
    );
  }
}
