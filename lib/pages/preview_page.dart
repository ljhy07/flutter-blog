import 'package:flutter/material.dart';
import '../components/preview_widget.dart';

class PreviewPage extends StatelessWidget {
  final String title;
  final String content;

  const PreviewPage({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Preview")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: PreviewWidget(title: title, content: content),
      ),
    );
  }
}
