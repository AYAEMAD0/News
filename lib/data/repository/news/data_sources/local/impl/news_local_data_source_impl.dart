//todo news local data source impl
import 'package:hive/hive.dart';
import 'package:news/model/news_response.dart';
import '../news_local_data_source.dart';

class NewsLocalDataSourceImpl implements NewsLocalDataSource{
  @override
  Future<NewsResponse> getNewsBySourceId(String sourceId, int page, int pageSize) async{
    // TODO: implement getNewsBySourceId
    var box=await Hive.openBox("News");
    return box.get(sourceId);
  }

  @override
  void saveNews(String sourceId, NewsResponse newsResponse)async {
    // TODO: implement saveNews
    var box=await Hive.openBox("News");
    await box.put(sourceId, newsResponse);
    await box.close();
  }

}