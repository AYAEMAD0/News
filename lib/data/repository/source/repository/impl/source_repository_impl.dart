//todo  source repository impl

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import '../../../../../model/source_response.dart';
import '../../data_source/local/source_local_data_source.dart';
import '../../data_source/remote/source_remote_data_source.dart';
import '../source_repository.dart';

@Injectable(as: SourceRepository)
class SourceRepositoryImpl implements SourceRepository {
  SourceRemoteDataSource sourceRemoteDataSource;
  SourceLocalDataSource sourceLocalDataSource;
  SourceRepositoryImpl({
    required this.sourceRemoteDataSource,
    required this.sourceLocalDataSource,
  });

  @override
  Future<SourceResponse> getSource(String categoryId) async {
    //todo check connect internet
    final List<ConnectivityResult> connectivityResult = await (Connectivity()
        .checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.ethernet) ||
        connectivityResult.contains(ConnectivityResult.vpn)) {
      //todo found internet
      var responseSources = await sourceRemoteDataSource.getSource(categoryId);
      //todo save into cache
      sourceLocalDataSource.saveSource(categoryId, responseSources);
      return responseSources;
    } else {
      //todo not found internet
      return sourceLocalDataSource.getSource(categoryId);
    }
  }
}
