
class PostResponse {
  String nextPageUrl;
  List<Post> posts;

  PostResponse.empty() {}

  PostResponse.formJson(Map<String, dynamic> json) {
    nextPageUrl = json["naxPageUrl"];
    if (json['users'] != null) {
      posts = (json["users"] as List)
          .map<Post>((postJson) => Post.fromJson(postJson))
          .toList();
    }
  }
}

class Post {
  int userId;
  int id;
  String title;
  String body;

  Post(this.userId, this.id, this.title, this.body);

  Post.fromJson(Map<String, dynamic> json) {
    userId = json["userId"];
    id = json["id"];
    title = json["title"];
    body = json["body"];
  }
}
