class UserInfoFavorite {
  int id;
  String name;
  String avatarUrl;
  bool favorite;

  UserInfoFavorite({required this.id, required this.name, required this.avatarUrl, this.favorite = false});

  factory UserInfoFavorite.fromJson(Map<String, dynamic> json) {
    return UserInfoFavorite(
      id: json['id'],
      name: json['name'],
      avatarUrl: json['avatarUrl'],
      favorite: json['favorite'] == 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'avatarUrl': avatarUrl,
      'favorite': favorite ? 1 : 0, // Convert boolean to int
    };
  }
}
