import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/blog_provider.dart';

class BlogListPage extends ConsumerWidget {
  const BlogListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final blogPosts = ref.watch(blogPostsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Blog Posts")),
      body: blogPosts.when(
        data: (posts) {
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return ListTile(
                title: Text(post.title),
                subtitle: Text(post.content),
                onTap: () {
                  // 상세 페이지로 이동 가능
                },
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text("Error: $e")),
      ),
    );
  }
}
