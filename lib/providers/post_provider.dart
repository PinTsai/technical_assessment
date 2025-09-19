
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
  final PostApi postApi;
  PostProvider(this.postApi);

  PostState _state = PostState.initial;
  List<Post> _posts = [];
  String _errorMessage = '';

  PostState get state => _state;
  List<Post> get posts => _posts;
  String get errorMessage => _errorMessage;

  Future<void> loadPosts() async {
    _state = PostState.loading;
    notifyListeners();

    try {
      _posts = await postApi.getPosts();
      _state = PostState.loaded;
    } catch (e) {
      _errorMessage = e.toString();
      _state = PostState.error;
    }
    notifyListeners();
  }
}