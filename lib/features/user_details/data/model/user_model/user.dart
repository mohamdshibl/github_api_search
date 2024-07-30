class UserDetails {
  String? login;
  int? id;
  String? avatarUrl;
  String? url;
  String? followersUrl;
  String? followingUrl;
  String? starredUrl;
  String? subscriptionsUrl;
  String? organizationsUrl;
  String? reposUrl;
  Null? name;
  Null? location;
  Null? email;
  Null? bio;
  int? publicRepos;
  int? publicGists;
  int? followers;
  int? following;

  UserDetails(
      {this.login,
        this.id,
        this.avatarUrl,
        this.url,
        this.followersUrl,
        this.followingUrl,
        this.starredUrl,
        this.subscriptionsUrl,
        this.organizationsUrl,
        this.reposUrl,
        this.name,
        this.location,
        this.email,
        this.bio,
        this.publicRepos,
        this.publicGists,
        this.followers,
        this.following});

  UserDetails.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    id = json['id'];
    avatarUrl = json['avatar_url'];
    url = json['url'];
    followersUrl = json['followers_url'];
    followingUrl = json['following_url'];
    starredUrl = json['starred_url'];
    subscriptionsUrl = json['subscriptions_url'];
    organizationsUrl = json['organizations_url'];
    reposUrl = json['repos_url'];
    name = json['name'];
    location = json['location'];
    email = json['email'];
    bio = json['bio'];
    publicRepos = json['public_repos'];
    publicGists = json['public_gists'];
    followers = json['followers'];
    following = json['following'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['login'] = login;
    data['id'] = id;
    data['avatar_url'] =avatarUrl;
    data['url'] = url;
    data['followers_url'] = followersUrl;
    data['following_url'] = followingUrl;
    data['starred_url'] =starredUrl;
    data['subscriptions_url'] = subscriptionsUrl;
    data['organizations_url'] =organizationsUrl;
    data['repos_url'] =reposUrl;
    data['name'] = name;
    data['location'] = location;
    data['email'] = email;
    data['bio'] = bio;
    data['public_repos'] = publicRepos;
    data['public_gists'] = publicGists;
    data['followers'] =followers;
    data['following'] = following;
    return data;
  }
}