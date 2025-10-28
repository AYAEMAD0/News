import 'package:flutter/material.dart';
import 'package:news/api/api_manger.dart';
import 'package:news/model/news_response.dart';
import 'package:news/model/source_response.dart';
import 'widget/news_item.dart';

class NewsWidget extends StatefulWidget {
  final Sources source;
  const NewsWidget({super.key, required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  List<News> articles = [];
  int page = 1;
  bool isLoading = false;
  bool hasMore = true;
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    getNews();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent &&
          !isLoading &&
          hasMore) {
        getNews();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Future<void> getNews() async {
    if (isLoading) return;
    setState(() => isLoading = true);

    final response = await ApiManger.getNewsBySourceId(
      widget.source.id!,
      page: page,
      pageSize: 10,
    );

    if (response.status == 'ok') {
      final newArticles = response.articles ?? [];
      setState(() {
        articles.addAll(newArticles);
        isLoading = false;
        if (newArticles.length < 10) hasMore = false;
        page++;
      });
    } else {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    print("-------------------------------------------------");
    print("Fetching news for ${widget.source.id} - page $page");
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    if (articles.isEmpty && isLoading) {
      return Center(child: CircularProgressIndicator(color: Theme.of(context).canvasColor,));
    }

    return ListView.builder(
      controller: scrollController,
      itemCount: hasMore ? articles.length + 1 : articles.length,
      itemBuilder: (context, index) {
        if (index < articles.length) {
          return NewsItem(news: articles[index]);
        } else {
          return  Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 0.04 * width,
              vertical: 0.09 * height,
            ),
            child: Center(child: CircularProgressIndicator(color:Theme.of(context).canvasColor)),
          );
        }
      },
    );
  }
}
