//todo  source remote data source impl
import 'package:injectable/injectable.dart';
import 'package:news/api/api_manger.dart';
import 'package:news/data/repository/source/data_source/remote/source_remote_data_source.dart';
import '../../../../../../model/source_response.dart';

@Injectable(as: SourceRemoteDataSource)
 class SourceRemoteDataSourceImpl implements SourceRemoteDataSource{
  ApiManger apiManger;
  SourceRemoteDataSourceImpl({required this.apiManger});
  @override
  Future<SourceResponse> getSource(String categoryId)async{
    var sourceResponse=await apiManger.getSource(categoryId);
    return sourceResponse;
  }
}