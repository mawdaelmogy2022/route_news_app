import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constants.dart';
import 'package:news_app/api/end_points.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/model/source_response.dart';

class ApiManager {
  static Future<SourceResponse?> getSources(
      {required String categoryId}) async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.soursesEndpoint,
        {"apiKey": ApiConstants.apiKey, "category": categoryId});
    try {
      var response = await http.get(url);
      String responseBody = response.body;
      // to do : string to json
      var json = jsonDecode(responseBody);
      // to do : json to object
      return SourceResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<NewsResponse?> getNewsbydourceId(String sourceId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.newsEndpoint,
        {'apiKey': ApiConstants.apiKey, 'sources': sourceId});
    try {
      var response = await http.get(url);
      var responseBody = response.body; // String
      // string => json
      var json = jsonDecode(responseBody);
      // json => object
      return NewsResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<NewsResponse?> getNewsbysearch(
      {required String qSearch}) async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.newsEndpoint, {
      "apiKey": ApiConstants.apiKey,
      "q": qSearch,
    });
    try {
      var response = await http.get(url);
      String responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewsResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}


// https://newsapi.org/v2/top-headlines/sources?apiKey=ce1c5194e2fe469991646f3a2d311701
//https://newsapi.org/v2/everything?q=apple&from=2025-08-03&to=2025-08-03&sortBy=popularity&apiKey=ce1c5194e2fe469991646f3a2d311701
//https://newsapi.org/v2/everything?q=bitcoin&apiKey=ce1c5194e2fe469991646f3a2d311701
