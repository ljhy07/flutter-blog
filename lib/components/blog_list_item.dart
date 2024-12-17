import 'package:flutter/material.dart';
import '../models/blog_post.dart';

class BlogListItem extends StatelessWidget {
  final BlogPost post;
  final VoidCallback onTap;

  const BlogListItem({super.key, required this.post, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(post.title),
      subtitle: Text("작성일: ${post.createdAt.toLocal()}"),
      onTap: onTap,
    );
  }
}
