import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/blog_post.dart';
import '../models/user.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // -----------------------
  // Blog Post 관련 기능
  // -----------------------
  Future<void> addBlogPost(BlogPost blogPost) async {
    try {
      await _db.collection('blogPosts').add(blogPost.toMap());
    } on FirebaseException catch (e) {
      print("Firebase Error: ${e.message}");
      // 추가적인 에러 처리를 여기에 할 수 있습니다.
    } catch (e) {
      print("Unknown Error: $e");
    }
  }

  Stream<List<BlogPost>> getBlogPosts() {
    return _db.collection("blogPosts").snapshots().map(
          (snapshot) => snapshot.docs
          .map((doc) => BlogPost.fromMap(doc.data() as Map<String, dynamic>, doc.id))
          .toList(),
    );
  }

  Future<void> deleteBlogPost(String id) async {
    await _db.collection("blogPosts").doc(id).delete();
  }

  Future<void> updateBlogPost(BlogPost post) async {
    await _db.collection("blogPosts").doc(post.id).update({
      "title": post.title,
      "content": post.content,
      "createdAt": post.createdAt,
    });
  }

  Future<void> updateBlogPostTags(String postId, List<String> newTags) async {
    try {
      await _db.collection('blogPosts').doc(postId).update({
        'tags': newTags,
      });
    } catch (e) {
      print("Error updating blog post tags: $e");
    }
  }

  // -----------------------
  // User 관련 기능
  // -----------------------
  Future<void> addUser(User user) async {
    await _db.collection("users").doc(user.id).set({
      "name": user.name,
      "profileDescription": user.profileDescription,
      "totalPosts": user.totalPosts,
      "totalViews": user.totalViews,
    });
  }

  Future<User> getUser(String userId) async {
    final doc = await _db.collection("users").doc(userId).get();
    final data = doc.data();

    if (data != null) {
      return User(
        id: userId,
        name: data["name"] ?? "User",
        profileDescription: data["profileDescription"] ?? "",
        totalPosts: data["totalPosts"] ?? 0,
        totalViews: data["totalViews"] ?? 0,
      );
    } else {
      throw Exception("User not found");
    }
  }

  Future<void> updateUserStats(String userId, {int? totalPosts, int? totalViews}) async {
    final updates = <String, dynamic>{};
    if (totalPosts != null) updates["totalPosts"] = totalPosts;
    if (totalViews != null) updates["totalViews"] = totalViews;

    await _db.collection("users").doc(userId).update(updates);
  }
}
