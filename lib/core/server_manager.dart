import 'dart:convert';

import 'package:http/http.dart' as http;
import "package:new_project/models/news_model.dart";

class ServerManager {
  String baseUrl = 'https://newsapi.org/v2';
  String apiKey = 'ae13d59febd14693a8a044071faf6bad';

  Future<NewsModel> getNews(int index) async {
    final response = await http.get(
      Uri.parse('$baseUrl/top-headlines?country=us&apiKey=$apiKey'),
    );

    Map<String, dynamic> data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return NewsModel.fromJson(data, index);
    } else {
      throw (data['message']);
    }
  }
}
