import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/api/api_constants.dart';
import 'package:news/api/api_endpoint.dart';
import 'package:news/model/news_response.dart';
import 'package:news/model/source_response.dart';

class ApiManger {
  //todo singleton
  static ApiManger? _instance;
  //todo private constructor
  ApiManger._();
  static ApiManger getInstance(){
    //todo check nullable instance
    _instance??=ApiManger._();
    return _instance!;
  }

   Future<SourceResponse> getSource(String categoryId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiEndpoint.sourceApi, {
      "apiKey": ApiConstants.apiKey,
      "category": categoryId,
    });
    try {
      var response = await http.get(url);
      String body = response.body; //todo string=>json=>object
      var json = jsonDecode(body);
      return SourceResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

   Future<NewsResponse> getNewsBySourceId(
      String sourceId, {
        int page = 1,
        int pageSize = 20,
      }) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiEndpoint.newApi, {
      "sources": sourceId,
      "apiKey": ApiConstants.apiKey,
      "page": page.toString(),
      "pageSize": pageSize.toString(),
    });

    var response = await http.get(url);
    var json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  }

  static Future<NewsResponse> searchNews({
    required String query,
    String searchIn = "title,description,content",
  }) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiEndpoint.newApi, {
      "q": query,
      "searchIn": searchIn,
      "apiKey": ApiConstants.apiKey,
    });

    try {
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      return NewsResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}
