import 'package:news/api/api_manger.dart';
import 'package:news/data/repository/news/data_sources/local/impl/news_local_data_source_impl.dart';
import 'package:news/data/repository/news/data_sources/local/news_local_data_source.dart';
import 'package:news/data/repository/news/data_sources/remote/impl/news_remote_data_source_impl.dart';
import 'package:news/data/repository/news/data_sources/remote/news_remote_data_source.dart';
import 'package:news/data/repository/news/repository/impl/news_repository_impl.dart';
import 'package:news/data/repository/news/repository/news_repository.dart';
import 'package:news/data/repository/source/data_source/local/source_local_data_source.dart';
import '../data/repository/source/data_source/local/impl/source_local_data_source_impl.dart';
import '../data/repository/source/data_source/remote/impl/source_remote_data_source_impl.dart';
import '../data/repository/source/data_source/remote/source_remote_data_source.dart';
import '../data/repository/source/repository/impl/source_repository_impl.dart';
import '../data/repository/source/repository/source_repository.dart';

//todo sourceViewModel==>sourceRepo
//todo sourceRepo==>sourceRemoteDataSource
//todo sourceRemoteDataSource==>ApiManger
//todo-----------------------------------------
//todo newsViewModel==>newsRepo
//todo newsRepo==>newsRemoteDataSource
//todo newsRemoteDataSource==>ApiManger

SourceRepository injectSourceRepository() {
  return SourceRepositoryImpl(
    sourceRemoteDataSource: injectSourceRemoteDataSource(),
    sourceLocalDataSource: injectSourceLocalDataSource(),
  );
}

SourceRemoteDataSource injectSourceRemoteDataSource() {
  return SourceRemoteDataSourceImpl(apiManger: injectSourceApiManger());
}

SourceLocalDataSource injectSourceLocalDataSource() {
  return SourceLocalDataSourceImpl();
}

ApiManger injectSourceApiManger() {
  return ApiManger();
}

NewsRepository injectNewsRepository() {
  return NewsRepositoryImpl(newsRemoteDataSource: injectNewsRemoteDataSource(),newsLocalDataSource:injectNewsLocalDataSource() );
}

NewsLocalDataSource injectNewsLocalDataSource() {
  return NewsLocalDataSourceImpl();
}

NewsRemoteDataSource injectNewsRemoteDataSource() {
  return NewsRemoteDataSourceImpl(apiManger: injectNewsApiManger());
}

ApiManger injectNewsApiManger() {
  return ApiManger();
}
