import '../app_theme.dart';
import 'package:flutter/material.dart';
import '../data/post_model.dart';

class PostsListItem extends StatelessWidget {
  final Post post;
  final VoidCallback onTap;

  const PostsListItem({
    required this.post,
    required this.onTap,
    super.key});

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
