import 'package:flutter/material.dart';
import 'package:news/api/api_manger.dart';
import '../../../../../model/news_response.dart';

class NewsViewModel extends ChangeNotifier {
  //todo handle logic - hold data
  String? errorMessage;
  List<News> newsList=[];
  bool isLoading = false;
  bool hasMore = true;
  int page = 1;

  void getNewsBySourceId(String sourceId) async {
    if (isLoading || !hasMore) return;
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final response = await ApiManger.getNewsBySourceId(
        sourceId,
        page: page,
        pageSize: 10,
      );

      if (response.status == 'ok') {
        final newArticles = response.articles ?? [];
        newsList.addAll(newArticles);
        if (newArticles.length < 10) {
          hasMore = false;
        } else {
          page++;
        }
      } else {
        errorMessage = response.message!;
      }
    } catch (e) {
      errorMessage = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}

