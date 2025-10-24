import 'package:flutter/material.dart';
import 'package:news/api/api_manger.dart';
import 'package:news/features/views/home/category_details/news/widget/news_item.dart';
import 'package:news/model/source_response.dart';
import '../../../../../core/widgets/error_api_widget.dart';
import '../../../../../core/widgets/error_base_widget.dart';
import '../../../../../core/widgets/loading_widget.dart';

class NewsWidget extends StatefulWidget {
  final Sources source;
  const NewsWidget({super.key, required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return FutureBuilder(
      future: ApiManger.getNewsBySourceId(widget.source.id!),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingWidget();
        } else if (snapshot.hasError) {
          return ErrorBaseWidget(
            onPressed: () {
              //todo reload
              ApiManger.getNewsBySourceId(widget.source.id!);
              setState(() {});
            },
          );
        } else if (snapshot.data?.status != 'ok') {
          return ErrorApiWidget(
            onPressed: () {
              //todo reload
              ApiManger.getNewsBySourceId(widget.source.id!);
              setState(() {});
            },
            message: snapshot.data!.message!,
          );
        }
        var data = snapshot.data!.articles ?? [];
        return ListView.separated(
          padding: EdgeInsets.only(top: height*0.025),
          itemBuilder: (context, index) => NewsItem(news: data[index]),
          separatorBuilder: (context, index) => SizedBox(height: 0.025 * height),
          itemCount: data.length,
        );
      },
    );
  }
}
