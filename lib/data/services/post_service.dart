import 'dart:convert';

import 'package:http/http.dart' as http;

class PostService {
  // ignore: constant_identifier_names
  static const FETCH_LIMIT = 15;
  static const baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<dynamic>> fetchPosts(int page) async {
    try {
      final response =
          await http.get(Uri.parse('$baseUrl?_limit=$FETCH_LIMIT&_page=$page'));

      return jsonDecode(response.body) as List<dynamic>;
    } catch (err) {
      return [];
    }
  }
}
