import 'dart:convert';
import 'package:http/http.dart' as http;
import '/models/news.dart';

class NewsApiService {
  final String apiKey1 = '53be4c3010104721bd799c4137d9fcf5'; // Ganti dengan API key Anda
  final String apiKey2 = '';
  final String apiKey3 = '';

  Future<List<NewsModel>> fetchTopHeadlines() async {
    final url = Uri.parse('https://newsapi.org/v2/everything?domains=wsj.com&apiKey=$apiKey1');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final articles = json['articles'] as List<dynamic>;
      return articles.map((article) => NewsModel.fromJson(article)).toList();
    } else {
      throw Exception('Failed to fetch top headlines');
    }
  }
}
