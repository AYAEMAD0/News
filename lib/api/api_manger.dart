import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/api/api_constants.dart';
import 'package:news/api/api_endpoint.dart';
import 'package:news/model/news_response.dart';
import 'package:news/model/source_response.dart';

class ApiManger {
  static Future<SourceResponse> getSource() async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiEndpoint.sourceApi, {
      "apiKey": ApiConstants.apiKey,
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

  Future<NewsResponse> getNewsBySourceId(String sourceId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiEndpoint.newApi, {
      "sources": sourceId,
      "apiKey": ApiConstants.apiKey,
    });
    var response=await http.get(url);
    var json =jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  }
}
