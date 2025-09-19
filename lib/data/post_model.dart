
// Model class representing a Post
class Post {
  final int userid;
  final int id;
  final String title;
  final String body;

  // Constructor for create a Post instance
  Post({
    required this.userid,
    required this.id,
    required this.title,
    required this.body
   });

  // Factory constructor to create a Post from a JSON object
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json["id"],
      userid: json["userId"],
      title: json["title"],
      body: json["body"],
    );
  }

}