import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../model/news_response.dart';
import 'web_view_item.dart';

class BottomSheetWidget extends StatelessWidget {
  final ScrollController scrollController;
  final News news;
  const BottomSheetWidget({super.key, required this.scrollController,required this.news});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      controller: scrollController,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.015,
          horizontal: width * 0.03,
        ),
        child: Column(
          spacing: 0.025 * height,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                imageUrl: news.urlToImage ?? "",
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).canvasColor,
                  ),
                ),
                errorWidget: (context, url, error) =>
                    Icon(Icons.error, color: AppColors.gray, size: 40),
              ),
            ),
            Text(
              news.content ?? AppStrings.noContent,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
              onPressed: () {
                // todo: view article in webView
                if (news.url != null && news.url!.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => WebViewItem(url: news.url!),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text(AppStrings.errorLink)),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).dividerColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: height * 0.02,
                  horizontal: width * 0.03,
                ),
                minimumSize: Size(width, height * 0.05),
              ),
              child: Text(
                AppStrings.viewArticle,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
