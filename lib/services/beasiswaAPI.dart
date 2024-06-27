import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:apps/models/beasiswa.dart';

class ScholarshipService {
  static const String apiUrl = 'https://api.github.com/search/repositories?q=scholarship';

  static Future<List<Beasiswa>> getScholarships() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        List<Beasiswa> scholarships = (jsonData['items'] as List)
            .map((item) => Beasiswa.fromJson(item))
            .toList();
        return scholarships;
      } else {
        throw Exception('Failed to load scholarships');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
