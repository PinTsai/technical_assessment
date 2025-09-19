
import 'package:flutter/cupertino.dart';
import 'package:technical_assessment/services/postApi.dart';
import '../data/post_model.dart';

// Define each states for post loading data
enum PostState {
  initial,
  loading,
  loaded,
  error
}

// Provider that manages fetching and storing the list of posts
// and holds the state related with loading data
class PostProvider extends ChangeNotifier {
  final PostApi postApi;
  PostProvider(this.postApi);

  // State variables
  PostState _state = PostState.initial;
  List<Post> _posts = [];
  String _errorMessage = '';

  // Public getters for the state variables.
  PostState get state => _state;
  List<Post> get posts => _posts;
  String get errorMessage => _errorMessage;

  // Loads the posts from the API and updates internal state and listeners
  Future<void> loadPosts() async {
    _state = PostState.loading;
    notifyListeners();

    // Fetch posts from the API and catch error
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