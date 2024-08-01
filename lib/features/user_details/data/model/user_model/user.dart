class UserInfo {
  UserInfo({
    required this.login,
    required this.id,
    required this.avatarUrl,
    required this.url,
    required this.htmlUrl,
    required this.followersUrl,
    required this.followingUrl,
    required this.starredUrl,
    required this.subscriptionsUrl,
    required this.organizationsUrl,
    required this.reposUrl,
    required this.name,
    required this.location,
    required this.email,
    required this.bio,
    required this.publicRepos,
    required this.publicGists,
    required this.followers,
    required this.following,
    required this.favorite, // Added favorite
  });

  final String? login;
  final int? id;
  final String? avatarUrl;
  final String? url;
  final String? htmlUrl;
  final String? followersUrl;
  final String? followingUrl;
  final String? starredUrl;
  final String? subscriptionsUrl;
  final String? organizationsUrl;
  final String? reposUrl;
  final dynamic name;
  final dynamic location;
  final dynamic email;
  final dynamic bio;
  final int? publicRepos;
  final int? publicGists;
  final int? followers;
  final int? following;
  final bool favorite; // Added favorite

  UserInfo copyWith({
    String? login,
    int? id,
    String? avatarUrl,
    String? url,
    String? htmlUrl,
    String? followersUrl,
    String? followingUrl,
    String? starredUrl,
    String? subscriptionsUrl,
    String? organizationsUrl,
    String? reposUrl,
    dynamic? name,
    dynamic? location,
    dynamic? email,
    dynamic? bio,
    int? publicRepos,
    int? publicGists,
    int? followers,
    int? following,
    bool? favorite, // Added favorite
  }) {
    return UserInfo(
      login: login ?? this.login,
      id: id ?? this.id,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      url: url ?? this.url,
      htmlUrl: htmlUrl ?? this.htmlUrl,
      followersUrl: followersUrl ?? this.followersUrl,
      followingUrl: followingUrl ?? this.followingUrl,
      starredUrl: starredUrl ?? this.starredUrl,
      subscriptionsUrl: subscriptionsUrl ?? this.subscriptionsUrl,
      organizationsUrl: organizationsUrl ?? this.organizationsUrl,
      reposUrl: reposUrl ?? this.reposUrl,
      name: name ?? this.name,
      location: location ?? this.location,
      email: email ?? this.email,
      bio: bio ?? this.bio,
      publicRepos: publicRepos ?? this.publicRepos,
      publicGists: publicGists ?? this.publicGists,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      favorite: favorite ?? this.favorite, // Added favorite
    );
  }

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      login: json["login"],
      id: json["id"],
      avatarUrl: json["avatar_url"],
      url: json["url"],
      htmlUrl: json['html_url'] ?? 'https://github.com/hasantayyar',
      followersUrl: json["followers_url"],
      followingUrl: json["following_url"],
      starredUrl: json["starred_url"],
      subscriptionsUrl: json["subscriptions_url"],
      organizationsUrl: json["organizations_url"],
      reposUrl: json["repos_url"],
      name: json["name"],
      location: json["location"],
      email: json["email"],
      bio: json["bio"] ?? 'developer',
      publicRepos: json["public_repos"],
      publicGists: json["public_gists"],
      followers: json["followers"],
      following: json["following"],
      favorite: json["favorite"] == 1, // Convert from JSON value
    );
  }

  Map<String, dynamic> toJson() => {
    "login": login,
    "id": id,
    "avatar_url": avatarUrl,
    "url": url,
    "followers_url": followersUrl,
    "following_url": followingUrl,
    "starred_url": starredUrl,
    "subscriptions_url": subscriptionsUrl,
    "organizations_url": organizationsUrl,
    "repos_url": reposUrl,
    "name": name,
    "location": location,
    "email": email,
    "bio": bio,
    "public_repos": publicRepos,
    "public_gists": publicGists,
    "followers": followers,
    "following": following,
    "favorite": favorite ? 1 : 0, // Convert to JSON value
  };

  @override
  String toString() {
    return "$login, $id, $avatarUrl, $url, $followersUrl, $followingUrl, "
        "$starredUrl, $subscriptionsUrl, $organizationsUrl, $reposUrl, $name,"
        " $location, $email, $bio, $publicRepos, $publicGists, $followers, $following, $favorite";
  }
}
