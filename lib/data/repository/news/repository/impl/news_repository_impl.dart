//todo repository impl
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:news/data/repository/news/data_sources/local/news_local_data_source.dart';
import 'package:news/data/repository/news/data_sources/remote/news_remote_data_source.dart';
import 'package:news/model/news_response.dart';
import '../news_repository.dart';

@Injectable(as: NewsRepository)
class NewsRepositoryImpl implements NewsRepository {
  NewsRemoteDataSource newsRemoteDataSource;
  NewsLocalDataSource newsLocalDataSource;
  NewsRepositoryImpl({required this.newsRemoteDataSource,required this.newsLocalDataSource});

  @override
  Future<NewsResponse> getNewsBySourceId(
    String sourceId,
    int page,
    int pageSize,
  ) async{
    //todo check connect internet
    final List<ConnectivityResult> connectivityResult = await (Connectivity()
        .checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.ethernet) ||
        connectivityResult.contains(ConnectivityResult.vpn)) {
      //todo found internet
      var responseNews = await newsRemoteDataSource.getNewsBySourceId(sourceId, page, pageSize);
      //todo save into cache
      newsLocalDataSource.saveNews(sourceId, responseNews);
      return responseNews;
    } else {
      //todo not found internet
      return newsLocalDataSource.getNewsBySourceId(sourceId, page, pageSize);
    }
  }
}
