// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../api/api_manger.dart' as _i339;
import '../bloc/news/news_cubit.dart' as _i372;
import '../bloc/source/source_cubit.dart' as _i489;
import '../data/repository/news/data_sources/local/impl/news_local_data_source_impl.dart'
    as _i393;
import '../data/repository/news/data_sources/local/news_local_data_source.dart'
    as _i851;
import '../data/repository/news/data_sources/remote/impl/news_remote_data_source_impl.dart'
    as _i852;
import '../data/repository/news/data_sources/remote/news_remote_data_source.dart'
    as _i833;
import '../data/repository/news/repository/impl/news_repository_impl.dart'
    as _i1060;
import '../data/repository/news/repository/news_repository.dart' as _i912;
import '../data/repository/source/data_source/local/impl/source_local_data_source_impl.dart'
    as _i988;
import '../data/repository/source/data_source/local/source_local_data_source.dart'
    as _i949;
import '../data/repository/source/data_source/remote/impl/source_remote_data_source_impl.dart'
    as _i758;
import '../data/repository/source/data_source/remote/source_remote_data_source.dart'
    as _i869;
import '../data/repository/source/repository/impl/source_repository_impl.dart'
    as _i94;
import '../data/repository/source/repository/source_repository.dart' as _i1056;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i339.ApiManger>(() => _i339.ApiManger());
    gh.factory<_i851.NewsLocalDataSource>(
        () => _i393.NewsLocalDataSourceImpl());
    gh.factory<_i833.NewsRemoteDataSource>(
        () => _i852.NewsRemoteDataSourceImpl(apiManger: gh<_i339.ApiManger>()));
    gh.factory<_i949.SourceLocalDataSource>(
        () => _i988.SourceLocalDataSourceImpl());
    gh.factory<_i912.NewsRepository>(() => _i1060.NewsRepositoryImpl(
          newsRemoteDataSource: gh<_i833.NewsRemoteDataSource>(),
          newsLocalDataSource: gh<_i851.NewsLocalDataSource>(),
        ));
    gh.factory<_i869.SourceRemoteDataSource>(() =>
        _i758.SourceRemoteDataSourceImpl(apiManger: gh<_i339.ApiManger>()));
    gh.factory<_i1056.SourceRepository>(() => _i94.SourceRepositoryImpl(
          sourceRemoteDataSource: gh<_i869.SourceRemoteDataSource>(),
          sourceLocalDataSource: gh<_i949.SourceLocalDataSource>(),
        ));
    gh.factory<_i372.NewsCubit>(
        () => _i372.NewsCubit(newsRepository: gh<_i912.NewsRepository>()));
    gh.factory<_i489.SourceCubit>(() =>
        _i489.SourceCubit(sourceRepository: gh<_i1056.SourceRepository>()));
    return this;
  }
}
