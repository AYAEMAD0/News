import '../../../../model/news_response.dart';

//todo interface repo
abstract class NewsRepository {
  Future<NewsResponse> getNewsBySourceId(
    String sourceId,
    int page,
    int pageSize,
  );
}
