//todo  source local data source impl
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:news/model/source_response.dart';
import '../source_local_data_source.dart';

@Injectable(as: SourceLocalDataSource)
class SourceLocalDataSourceImpl implements SourceLocalDataSource{
  @override
  Future<SourceResponse> getSource(String categoryId) async{
    // TODO: implement getSource
    var box=await Hive.openBox("Sources");
    var data=await box.get(categoryId);
    //todo map=>object
    // todo  return SourceResponse.fromJson(data);
    return data;
  }

  @override
  void saveSource(String categoryId, SourceResponse sourceResponse)async {
    // TODO: implement saveSource
    var box=await Hive.openBox("Sources");
    //todo object=>map
    //todo await box.put(categoryId, sourceResponse.toJson());
    await box.put(categoryId,sourceResponse);
    await box.close();
  }

}