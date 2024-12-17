class User {
  final String id;
  final String name;
  final String profileDescription;
  final int totalPosts;
  final int totalViews;

  User({
    required this.id,
    required this.name,
    this.profileDescription = "",
    this.totalPosts = 0,
    this.totalViews = 0,
  });

  User copyWith({
    String? name,
    String? profileDescription,
    int? totalPosts,
    int? totalViews,
  }) {
    return User(
      id: id,
      name: name ?? this.name,
      profileDescription: profileDescription ?? this.profileDescription,
      totalPosts: totalPosts ?? this.totalPosts,
      totalViews: totalViews ?? this.totalViews,
    );
  }
}
