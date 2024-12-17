import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/blog_post.dart';
import '../services/firestore_service.dart';

final blogPostsProvider = StreamProvider<List<BlogPost>>((ref) {
  return FirestoreService().getBlogPosts();
});

final blogPostProvider = StateNotifierProvider<BlogPostNotifier, AsyncValue<List<BlogPost>>>((ref) {
  return BlogPostNotifier();
});

class BlogPostNotifier extends StateNotifier<AsyncValue<List<BlogPost>>> {
  final FirestoreService _firestoreService = FirestoreService();

  BlogPostNotifier() : super(const AsyncValue.loading()) {
    loadBlogPosts();
  }

  void loadBlogPosts() {
    _firestoreService.getBlogPosts().listen((posts) {
      state = AsyncValue.data(posts);
    });
  }

  Future<void> addBlogPost(BlogPost post) async {
    await _firestoreService.addBlogPost(post);
  }

  Future<void> deleteBlogPost(String id) async {
    await _firestoreService.deleteBlogPost(id);
  }

  Future<void> updateBlogPost(BlogPost post) async {
    await _firestoreService.updateBlogPost(post);
  }
}
