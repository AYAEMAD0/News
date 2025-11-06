import 'package:flutter/material.dart';
import 'package:news/api/api_manger.dart';
import '../../../../model/source_response.dart';

class CategoryDetailsViewModel extends ChangeNotifier {
  //todo handle logic - hold data
  String? errorMessage;
  List<Sources>? sourceList;

   void getSources(String categoryId) async {
    errorMessage=null;
    sourceList=null;
    notifyListeners();

    try {
      var response = await ApiManger.getSource(categoryId);
      if (response.status == 'error') {
        errorMessage = response.message;
      } else {
        sourceList = response.sources;
      }
    } catch (e) {
      errorMessage = e.toString();
    }
    notifyListeners();
  }
}
