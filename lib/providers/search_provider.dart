import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/blog_post.dart';
import 'blog_provider.dart';

final searchQueryProvider = StateProvider<String>((ref) => "");

final filteredPostsProvider = Provider<List<BlogPost>>((ref) {
  final posts = ref.watch(blogPostsProvider).asData?.value ?? [];
  final query = ref.watch(searchQueryProvider).toLowerCase();

  if (query.isEmpty) return posts;

  return posts.where((post) => post.title.toLowerCase().contains(query)).toList();
});
