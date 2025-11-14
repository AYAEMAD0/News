//todo  source repository impl

import '../../../../../model/source_response.dart';
import '../../data_source/remote/source_remote_data_source.dart';
import '../source_repository.dart';

class SourceRepositoryImpl implements SourceRepository {
  SourceRemoteDataSource sourceRemoteDataSource;
  SourceRepositoryImpl({required this.sourceRemoteDataSource});

  @override
  Future<SourceResponse> getSource(String categoryId) {
    return sourceRemoteDataSource.getSource(categoryId);
  }
}
