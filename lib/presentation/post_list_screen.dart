import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technical_assessment/presentation/post_detail_screen.dart';
import 'package:technical_assessment/presentation/posts_list_item.dart';
import '../providers/post_provider.dart';


class PostListScreen extends StatefulWidget {
  const PostListScreen({super.key});

  @override
  State<PostListScreen> createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<PostProvider>(context, listen:false).loadPosts();
  }


  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts")
      ),
      body: Consumer<PostProvider>
        (builder: (context, provider, child) {
          switch (provider.state) {
            case PostState.initial:
            case PostState.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
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
                    const Text(
                      "Error loading posts"
                    ),
                    const SizedBox(height: 10),
                    Text(
                        provider.errorMessage,
                      textAlign: TextAlign.center
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                        onPressed: () => provider.loadPosts(),
                        icon:  const Icon(Icons.refresh),
                        label: const Text("Retry"),
                    ),
                  ],
                ),
              );

            case PostState.loaded:
              return ListView.builder(
                itemCount: provider.posts.length,
                  itemBuilder: (context, index) {
                  final post = provider.posts[index];
                  return PostsListItem(
                      post: post,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PostDetailScreen(post: post),
                          ),
                        );
                      },
                  );
                  },
              );
          }
      },

      )
    );
  }
}

