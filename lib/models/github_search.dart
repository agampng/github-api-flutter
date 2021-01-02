part of 'models.dart';

class Item {
  Item({
    this.login,
    this.id,
    this.avatarUrl,
    this.url,
  });

  String login;
  int id;
  String avatarUrl;
  String url;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        login: json["login"],
        id: json["id"],
        avatarUrl: json["avatar_url"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "login": login,
        "id": id,
        "avatar_url": avatarUrl,
        "url": url,
      };
}

class IssuesItem {
  IssuesItem({
    this.title,
    this.createdAt,
    this.state,
  });

  String title;
  DateTime createdAt;
  String state;

  factory IssuesItem.fromJson(Map<String, dynamic> json) => IssuesItem(
        title: json["title"],
        createdAt: DateTime.parse(json["created_at"]),
        state: json["state"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "created_at": createdAt.toIso8601String(),
        "state": state,
      };
}

class RepositoriesItem {
  RepositoriesItem({
    this.fullName,
    this.stargazersCount,
    this.forks,
    this.watchers,
  });

  String fullName;
  int stargazersCount;
  int forks;
  int watchers;

  factory RepositoriesItem.fromJson(Map<String, dynamic> json) =>
      RepositoriesItem(
        fullName: json["full_name"],
        stargazersCount: json["stargazers_count"],
        forks: json["forks"],
        watchers: json["watchers"],
      );

  Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "stargazers_count": stargazersCount,
        "forks": forks,
        "watchers": watchers,
      };
}
