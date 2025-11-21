//todo interface source local dats source
import 'package:news/model/source_response.dart';

abstract class SourceLocalDataSource{
  Future<SourceResponse> getSource(String categoryId);
  void saveSource(String categoryId,SourceResponse sourceResponse);
}
