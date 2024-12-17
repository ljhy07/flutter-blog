import 'package:cloud_firestore/cloud_firestore.dart';

class BlogPost {
  final String id;
  final String title;
  final String content;
  final DateTime createdAt;
  final List<String> tags;  // 태그 추가

  BlogPost({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.tags,  // 태그 필드 추가
  });

  // Map 데이터를 객체로 변환하는 함수
  factory BlogPost.fromMap(Map<String, dynamic> data, String documentId) {
    return BlogPost(
      id: documentId,
      title: data['title'] ?? '',
      content: data['content'] ?? '',
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      tags: List<String>.from(data['tags'] ?? []),  // 태그 처리
    );
  }

  // 객체를 Map 데이터로 변환하는 함수
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'createdAt': createdAt,
      'tags': tags,  // 태그 필드 추가
    };
  }
}
