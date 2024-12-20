import 'dart:convert';

import 'package:http/http.dart' as http;
import "package:new_project/models/news_model.dart";

class ServerManager {
  final String baseUrl = 'https://newsapi.org/v2/top-headlines';
  String apiKey = 'ae13d59febd14693a8a044071faf6bad';

  Future<List<NewsModel>> getNews() async {
    final response = await http.get(
      Uri.parse('$baseUrl?country=us&apiKey=$apiKey'),
    );

    Map<String, dynamic> data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return NewsModel.fromJsonList(data);
    } else {
      throw (data['message']);
    }
  }
}
