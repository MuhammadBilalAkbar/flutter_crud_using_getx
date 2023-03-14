class Post {
  Post({
    this.id = 1,
    this.title = '',
    this.body = '',
  });

  int id;
  String title;
  String body;

  factory Post.fromJson(Map<dynamic, dynamic> json) => Post(
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body": body,
      };
}
