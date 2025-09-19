import '../app_theme.dart';
import 'package:flutter/material.dart';
import '../data/post_model.dart';

// Single post card for display each post in post list view
class PostsListItem extends StatelessWidget {
  final Post post;
  final VoidCallback onTap;

  const PostsListItem({
    required this.post,
    required this.onTap,
    super.key});

  // Returns a Card widget containing title and body
  // And handle tap event
  @override
  Widget build(BuildContext context) {
    return Card(
      color: CustomColors.blue10,
      child: ListTile(
        title: Text(
          post.title
        ),
        subtitle: Text(
          post.body
        ),
        onTap: onTap,
      ),
    );
  }
}
