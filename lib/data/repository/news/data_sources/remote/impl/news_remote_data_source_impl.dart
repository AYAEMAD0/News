import 'package:news/api/api_manger.dart';
import 'package:news/model/news_response.dart';
import '../news_remote_data_source.dart';
//todo news remote data source impl

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  ApiManger apiManger;
  NewsRemoteDataSourceImpl({required this.apiManger});
  @override
  Future<NewsResponse> getNewsBySourceId(
    String sourceId,
    int page,
    int pageSize,
  ) async {
    var newResponse = await apiManger.getNewsBySourceId(
      sourceId,
      page: page,
      pageSize: pageSize,
    );
    return newResponse;
  }
}
