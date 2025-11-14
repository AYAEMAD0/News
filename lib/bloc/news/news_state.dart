import '../../model/news_response.dart';

abstract class NewsState {}

class InitialState extends NewsState {}

class LoadingState extends NewsState {}

class PaginationLoadingState extends NewsState {}

class SuccessState extends NewsState {
  final List<News> newsList;
  final bool hasMore;
  SuccessState({required this.newsList, this.hasMore = true});
}

class ErrorState extends NewsState {
  String? errorMessage;
  ErrorState({required this.errorMessage});
}
