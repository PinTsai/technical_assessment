import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../data/post_model.dart';

// Stateless widget for display post detail information
class PostDetailScreen extends StatelessWidget {
  final Post post;

  const PostDetailScreen({super.key, required this.post});

  // Return a widget with post detail
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post Details"),
        backgroundColor: CustomColors.blue10,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.title,
              style: const TextStyle(
                color: CustomColors.primaryText,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Post ID: ${post.id}",
              style: const TextStyle(
                color: CustomColors.secondaryText,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
                "User ID: ${post.userid}",
              style: const TextStyle(
              color: CustomColors.secondaryText,
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
            ),
            const Divider(height: 32),
            const Text(
                "Content",
              style: TextStyle(
                color: CustomColors.primaryText,
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              post.body,
              style: const TextStyle(
              color: CustomColors.primaryText,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
            ),

          ],
        )
      )
    );
  }
}
