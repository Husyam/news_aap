import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/data/model/article.dart';

class ApiService {
  static const String _baseUrl = 'https://newsapi.org/v2/';
  static const String _apiKey = '59f5120361544e179bbce2a0f75e3322';
  static const String _category = 'business';
  static const String _country = 'us';

  Future<ArticlesResult> topHeadlines() async {
    final response = await http.get(Uri.parse(
        "${_baseUrl}top-headlines?country=$_country&category=$_category&apiKey=$_apiKey"));
    // print(response.body);
    // print(response.statusCode);
    if (response.statusCode == 200) {
      print(json.decode(response.body));

      return ArticlesResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
}
