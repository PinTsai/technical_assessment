import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:technical_assessment/data/post_model.dart';

class PostApi {
  static const baseUrl = "https://jsonplaceholder.typicode.com";
  static const posts = "/posts";
  static const users = "/users";


  static Future<List<Post>> getPosts() async {
    try {
      final response = await http.get (
          Uri.parse("$baseUrl+ $posts"),
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        return jsonList.map((json) => Post.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load posts");
      }
    } catch (e) {
  throw Exception("Network error: $e");
  }
