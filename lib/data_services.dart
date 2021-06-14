import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherblocapp/post.dart';

class DataServices {
  final _baseUrl = 'https://jsonplaceholder.typicode.com/photos';

  Future<List<Post>> getPosts() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      final json = jsonDecode(response.body) as List;
      final posts = json.map((e) => Post.fromJson(e)).toList();
      return posts;
    } catch (e) {
      throw e;
    }
  }
}
