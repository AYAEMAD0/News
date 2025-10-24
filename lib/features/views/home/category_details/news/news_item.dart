import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_time_ago/get_time_ago.dart';
import 'package:news/core/constants/app_strings.dart';
import 'package:news/core/theme/app_colors.dart';
import 'package:news/model/news_response.dart';
import '../../../../../core/theme/app_styles.dart';

class NewsItem extends StatelessWidget {
  final News news;
  const NewsItem({super.key, required this.news,});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    var convertedTimestamp = DateTime.parse(news.publishedAt??"");
    var time = GetTimeAgo.parse(convertedTimestamp);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.020,
        vertical: height * 0.0093,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: width * 0.02,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).canvasColor),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        spacing: 0.01 * height,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
              imageUrl: news.urlToImage??"",
              placeholder: (context, url) => CircularProgressIndicator(color:Theme.of(context).canvasColor ),
              errorWidget: (context, url, error) => Icon(Icons.error,color: AppColors.gray,size: 40,),
            ),
          ),
          Text(news.title??AppStrings.noTitle, style: Theme.of(context).textTheme.labelLarge),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text("By: ${news.author}", style: TextStyles.font14GrayMedium)),
              //todo convert time minute  2025-10-23T09:42:28Z
              Text(time, style: TextStyles.font14GrayMedium),
            ],
          ),
        ],
      ),
    );
  }
}
