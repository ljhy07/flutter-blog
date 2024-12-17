import 'package:flutter/material.dart';

class UserProfileCard extends StatelessWidget {
  final String userName;
  final int totalPosts;
  final int totalViews;

  const UserProfileCard({
    super.key,
    required this.userName,
    required this.totalPosts,
    required this.totalViews,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 10),
            Text(
              userName,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text("총 게시글: $totalPosts | 총 조회수: $totalViews"),
          ],
        ),
      ),
    );
  }
}
