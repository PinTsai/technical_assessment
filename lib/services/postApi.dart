import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:technical_assessment/data/post_model.dart';

class PostApi {
  final baseUrl = "https://jsonplaceholder.typicode.com";
  final posts = "/posts";
  final http.Client client;
  PostApi(this.client);

    Future<List<Post>> getPosts() async {
    try {
      final url = "$baseUrl$posts";
      // print("Making request to: $url");

      final response = await client.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

    if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        return jsonList.map((json) => Post.fromJson(json)).toList();
      } else {
        throw Exception("HTTP ${response.statusCode}: Failed to load posts");
      }
    } catch (e) {
      throw Exception("Network error: $e");
    }
  }
}