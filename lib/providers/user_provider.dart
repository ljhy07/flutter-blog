import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user.dart';
import '../services/firestore_service.dart';

final userProvider = StateNotifierProvider<UserNotifier, User?>((ref) {
  return UserNotifier();
});

class UserNotifier extends StateNotifier<User?> {
  final FirestoreService _firestoreService = FirestoreService();

  UserNotifier() : super(null);

  // Firestore에서 사용자 데이터 불러오기
  Future<void> loadUser(String userId) async {
    final user = await _firestoreService.getUser(userId);
    state = user;
  }

  // 사용자 정보 업데이트
  Future<void> updateUser({String? name, String? description}) async {
    if (state != null) {
      final updatedUser = state!.copyWith(
        name: name ?? state!.name,
        profileDescription: description ?? state!.profileDescription,
      );
      await _firestoreService.addUser(updatedUser);
      state = updatedUser;
    }
  }

  // 사용자 통계 업데이트
  Future<void> updateStatistics({int? posts, int? views}) async {
    if (state != null) {
      final updatedUser = state!.copyWith(
        totalPosts: posts ?? state!.totalPosts,
        totalViews: views ?? state!.totalViews,
      );
      await _firestoreService.updateUserStats(state!.id, totalPosts: posts, totalViews: views);
      state = updatedUser;
    }
  }
}
