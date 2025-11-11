import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/api/api_manger.dart';
import 'package:news/bloc/news/news_state.dart';
import 'package:news/model/news_response.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(InitialState());

  List<News> articles = [];
  int page = 1;
  bool hasMore = true;
  bool isLoading = false;

  Future<void> getNewsBySourceId(String sourceId, {bool reset = false}) async {
    if (isLoading) return;
    isLoading = true;

    if (reset) {
      articles = [];
      page = 1;
      hasMore = true;
    }

    if (page == 1) {
      emit(LoadingState());
    } else {
      emit(PaginationLoadingState());
    }

    try {
      final response = await ApiManger.getNewsBySourceId(
        sourceId,
        page: page,
        pageSize: 10,
      );

      if (response.status == 'ok') {
        final newArticles = response.articles ?? [];

        articles.addAll(newArticles);
        hasMore = newArticles.length == 10;
        page++;

        emit(SuccessState(newsList: List.from(articles), hasMore: hasMore));
      } else {
        emit(ErrorState(errorMessage: response.message));
      }
    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }

    isLoading = false;
  }
}
