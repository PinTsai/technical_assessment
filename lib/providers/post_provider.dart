
import 'package:flutter/cupertino.dart';
import 'package:technical_assessment/services/postApi.dart';
import '../data/post_model.dart';

enum PostState {
  initial,
  loading,
  loaded,
  error
}

class PostProvider extends ChangeNotifier {

  PostState _state = PostState.initial;
  List<Post> _posts = [];

  PostState get state => _state;
  List<Post> get posts => _posts;

  Future<void> loadPosts() async {
    _state = PostState.loading;
    notifyListeners();

    try {
      _posts = await PostApi.getPosts();
      _state = PostState.loaded;
    } catch (e) {
      print("Error: $e");
      _state = PostState.error;
    }
    notifyListeners();
  }
}