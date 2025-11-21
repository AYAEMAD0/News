//todo interface news local data source
import '../../../../../model/news_response.dart';

abstract class NewsLocalDataSource {
  Future<NewsResponse> getNewsBySourceId(
      String sourceId,
      int page,
      int pageSize,
      );
  void saveNews(String sourceId,NewsResponse newsResponse);
}