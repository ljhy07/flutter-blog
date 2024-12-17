import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../components/user_profile_card.dart';
import '../providers/user_provider.dart';
import '../providers/blog_provider.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("My Profile")),
      body: user == null
          ? const Center(child: CircularProgressIndicator())
          : Column(
        children: [
          UserProfileCard(
            userName: user.name,
            totalPosts: user.totalPosts,
            totalViews: user.totalViews,
          ),
          const SizedBox(height: 20),
          const Text("내가 작성한 글", style: TextStyle(fontSize: 18)),
          // 게시글 추가 부분은 그대로 유지
        ],
      ),
    );
  }
}
