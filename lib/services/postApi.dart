import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:technical_assessment/data/post_model.dart';

// API service class for fetching post data
class PostApi {
  final baseUrl = "https://jsonplaceholder.typicode.com";
  final posts = "/posts";
  final http.Client client;
  PostApi(this.client);


  // Fetches the list of posts from the API
  // Returns a [Future] that completes with a list of [Post] objects
  // Throws an [Exception] if there is a network or parsing error
  Future<List<Post>> getPosts() async {
    try {
      final url = "$baseUrl$posts";

      // Make the GET request
      final response = await client.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      // If request was successful, decode the JSON and map to Post list
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        return jsonList.map((json) => Post.fromJson(json)).toList();
      }

      // If not successful, throw error with status code
      else {
        throw Exception("HTTP ${response.statusCode}: Failed to load posts");
      }
    } catch (e) {
      throw Exception("Network error: $e");
    }
  }
}
