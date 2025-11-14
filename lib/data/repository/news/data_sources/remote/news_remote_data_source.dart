import '../../../../../model/news_response.dart';

//todo interface news remote data source
abstract class NewsRemoteDataSource {
  Future<NewsResponse> getNewsBySourceId(
    String sourceId,
    int page,
    int pageSize,
  );
}
