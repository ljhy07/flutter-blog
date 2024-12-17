import 'package:flutter/material.dart';

class PreviewWidget extends StatelessWidget {
  final String title;
  final String content;

  const PreviewWidget({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Preview", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text(title, style: const TextStyle(fontSize: 18)),
        const SizedBox(height: 10),
        Text(content),
      ],
    );
  }
}
