//todo interface source repository
import '../../../../model/source_response.dart';

abstract class SourceRepository{
  Future<SourceResponse> getSource(String categoryId);
}