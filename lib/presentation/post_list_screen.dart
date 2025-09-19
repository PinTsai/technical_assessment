import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technical_assessment/presentation/post_detail_screen.dart';
import 'package:technical_assessment/presentation/posts_list_item.dart';
import '../providers/post_provider.dart';

// Main screen displays a list of posts
// Handle loading, error, and display states
class PostListScreen extends StatefulWidget {
  const PostListScreen({super.key});

  @override
  State<PostListScreen> createState() => _PostListScreenState();
}

// State class for PostListScreen
class _PostListScreenState extends State<PostListScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<PostProvider>(context, listen: false).loadPosts();
  }

  @override
  Widget build(BuildContext context) {
    // Obtain the current post provider
    final postProvider = context.watch<PostProvider>();

    return Scaffold(
        appBar: AppBar(title: const Text("Posts")),

        //  Adapt the changes in PostProvider to update UI accordingly.
        body: Consumer<PostProvider>(
          builder: (context, provider, child) {

            // Handle different loading status
            switch (postProvider.state) {

              // Initial and loading states: Display loading indicator
              case PostState.initial:
              case PostState.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );

              // Error status: Display error message and provide retry
              case PostState.error:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        size: 64,
                        color: Colors.red,
                      ),
                      const SizedBox(height: 10),
                      const Text("Error loading posts"),
                      const SizedBox(height: 10),
                      Text(postProvider.errorMessage,
                          textAlign: TextAlign.center),
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: () => postProvider.loadPosts(),
                        icon: const Icon(Icons.refresh),
                        label: const Text("Retry"),
                      ),
                    ],
                  ),
                );

              // Loaded state: Display the list of posts and allow pull-to-refresh.
              case PostState.loaded:
                return RefreshIndicator(
                    onRefresh: provider.loadPosts,
                    child: ListView.builder(
                      itemCount: postProvider.posts.length,
                      itemBuilder: (context, index) {
                        final post = postProvider.posts[index];
                        return PostsListItem(
                          post: post,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    PostDetailScreen(post: post),
                              ),
                            );
                          },
                        );
                      },
                    ));
            }
          },
        ));
  }
}
