import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'pages/main_page.dart';

void main() {
  runApp(const ProviderScope(child: BlogApp()));
}

class BlogApp extends StatelessWidget {
  const BlogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Blog',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const BlogListPage(),
    );
  }
}
