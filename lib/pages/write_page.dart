import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/blog_post.dart';
import '../providers/blog_provider.dart';
import 'package:uuid/uuid.dart';

class WriteBlogPage extends ConsumerStatefulWidget {
  const WriteBlogPage({super.key});

  @override
  ConsumerState<WriteBlogPage> createState() => _WriteBlogPageState();
}

class _WriteBlogPageState extends ConsumerState<WriteBlogPage> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  void _savePost() async {
    final newPost = BlogPost(
      id: const Uuid().v4(), // UUID를 통해 고유 ID 생성
      title: _titleController.text,
      content: _contentController.text,
      createdAt: DateTime.now(),
      tags: [],
    );

    await ref.read(blogPostProvider.notifier).addBlogPost(newPost);
    Navigator.pop(context); // 글쓰기 후 뒤로 가기
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Write Blog")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: "Title"),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: TextField(
                controller: _contentController,
                decoration: const InputDecoration(labelText: "Content"),
                maxLines: null,
                expands: true,
              ),
            ),
            ElevatedButton(
              onPressed: _savePost,
              child: const Text("Save Post"),
            )
          ],
        ),
      ),
    );
  }
}
